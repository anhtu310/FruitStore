/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controll;

import dal.FruitDAO;
import dal.OrderDAO;
import dal.OrderDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;
import model.OrderDetails;

/**
 *
 * @author tu588
 */
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int fruitId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        OrderDAO od = new OrderDAO();
        OrderDetailsDAO odd = new OrderDetailsDAO();
        FruitDAO fd = new FruitDAO();

        // Lấy userId từ cookie
        Cookie[] cookies = request.getCookies();
        int userId = 0; // Giá trị mặc định
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userCookie")) {
                    String cookieValue = cookie.getValue();
                    String[] values = cookieValue.split(":");
                    userId = Integer.parseInt(values[0]);
                    break;
                }
            }
        }

        // Kiểm tra xem người dùng đã có Order chưa được thanh toán
        Order existingOrder = od.getUnpaidOrder(userId);
        Order order;
        if (existingOrder != null) {
            // Sử dụng Order hiện có
            order = existingOrder;
        } else {
            // Tạo Order mới
            order = new Order();
            order.setUserId(userId);
            order.setOrderDate(new java.sql.Date(new java.util.Date().getTime()));
            order.setIsPaid(false); // Đặt giá trị isPaid thành false cho đơn hàng mới
            int orderId = od.addOrder(order);
            order.setOrderId(orderId);
        }

        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setOrderId(order.getOrderId());
        orderDetails.setFruitId(fruitId);
        orderDetails.setQuantity(quantity);
        orderDetails.setPrice((int) fd.getFruitByID(fruitId).getPrice());
        orderDetails.setTotal(orderDetails.getTotal());
        odd.addOrderDetails(orderDetails);

        // Lấy danh sách orderDetails liên quan đến orderId
        List<OrderDetails> orderDetailsList = odd.getOrderDetailsByOrderId(od.getUnpaidOrder(userId).getOrderId());
        int totalAmount = 0;
        for (OrderDetails details : orderDetailsList) {
            totalAmount += details.getTotal();
        }
        order.setTotalAmount(totalAmount);
        order.setIsPaid(false);
        od.updateOrder(order);
        response.sendRedirect("home");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
