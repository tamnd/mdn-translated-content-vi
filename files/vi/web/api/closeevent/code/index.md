---
title: "CloseEvent: thuộc tính code"
short-title: code
slug: Web/API/CloseEvent/code
page-type: web-api-instance-property
browser-compat: api.CloseEvent.code
---

{{APIRef("Websockets API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`code`** của giao diện {{domxref("CloseEvent")}} trả về một [mã đóng kết nối WebSocket](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.1.5) cho biết lý do kết nối bị đóng.

## Giá trị

Một [mã đóng kết nối WebSocket](https://www.rfc-editor.org/rfc/rfc6455.html#section-7.1.5) kiểu số nguyên trong phạm vi `1000` - `4999`, cho biết lý do kết nối bị đóng.

<table class="no-markdown">
  <thead>
    <tr>
      <th>Mã trạng thái</th>
      <th>Ý nghĩa</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>0</code>–<code>999</code></td>
      <td></td>
      <td>Không dùng.</td>
    </tr>
    <tr>
      <td><code>1000</code></td>
      <td>Đóng bình thường</td>
      <td>
        Kết nối đã hoàn thành thành công mục đích mà nó được tạo ra.
      </td>
    </tr>
    <tr>
      <td><code>1001</code></td>
      <td>Rời đi</td>
      <td>
        Điểm cuối đang rời đi, hoặc do máy chủ gặp sự cố, hoặc do trình duyệt
        đang điều hướng khỏi trang đã mở kết nối.
      </td>
    </tr>
    <tr>
      <td><code>1002</code></td>
      <td>Lỗi giao thức</td>
      <td>
        Điểm cuối đang chấm dứt kết nối do lỗi giao thức.
      </td>
    </tr>
    <tr>
      <td><code>1003</code></td>
      <td>Dữ liệu không được hỗ trợ</td>
      <td>
        Kết nối đang bị chấm dứt vì điểm cuối nhận được dữ liệu có kiểu mà nó
        không thể chấp nhận. (Ví dụ: một điểm cuối chỉ hỗ trợ văn bản lại nhận
        dữ liệu nhị phân.)
      </td>
    </tr>
    <tr>
      <td><code>1004</code></td>
      <td>Được dành riêng</td>
      <td>
        <strong>Được dành riêng.</strong> Ý nghĩa có thể sẽ được định nghĩa
        trong tương lai.
      </td>
    </tr>
    <tr>
      <td><code>1005</code></td>
      <td>Không nhận được trạng thái</td>
      <td>
        <strong>Được dành riêng.</strong> Cho biết không có mã trạng thái nào
        được cung cấp dù đáng lẽ phải có.
      </td>
    </tr>
    <tr>
      <td><code>1006</code></td>
      <td>Đóng bất thường</td>
      <td>
        <strong>Được dành riêng.</strong> Cho biết một kết nối đã bị đóng bất
        thường (tức là không gửi khung đóng) trong khi lẽ ra phải có mã trạng
        thái.
      </td>
    </tr>
    <tr>
      <td><code>1007</code></td>
      <td>Dữ liệu tải của khung không hợp lệ</td>
      <td>
        Điểm cuối đang chấm dứt kết nối vì đã nhận được một thông điệp chứa dữ
        liệu không nhất quán (ví dụ: dữ liệu không phải UTF-8 trong một thông
        điệp văn bản).
      </td>
    </tr>
    <tr>
      <td><code>1008</code></td>
      <td>Vi phạm chính sách</td>
      <td>
        Điểm cuối đang chấm dứt kết nối vì đã nhận được một thông điệp vi phạm
        chính sách của nó. Đây là mã trạng thái tổng quát, được dùng khi các mã
        1003 và 1009 không phù hợp.
      </td>
    </tr>
    <tr>
      <td><code>1009</code></td>
      <td>Thông điệp quá lớn</td>
      <td>
        Điểm cuối đang chấm dứt kết nối vì đã nhận được một khung dữ liệu quá
        lớn.
      </td>
    </tr>
    <tr>
      <td><code>1010</code></td>
      <td>Thiếu phần mở rộng bắt buộc</td>
      <td>
        Client đang chấm dứt kết nối vì nó mong đợi máy chủ thương lượng một
        hoặc nhiều phần mở rộng, nhưng máy chủ đã không làm vậy.
      </td>
    </tr>
    <tr>
      <td><code>1011</code></td>
      <td>Lỗi nội bộ</td>
      <td>
        Máy chủ đang chấm dứt kết nối vì gặp một điều kiện bất ngờ khiến nó
        không thể hoàn thành yêu cầu.
      </td>
    </tr>
    <tr>
      <td><code>1012</code></td>
      <td><a href="https://mailarchive.ietf.org/arch/msg/hybi/P_1vbD9uyHl63nbIIbFxKMfSwcM/">Khởi động lại dịch vụ</a></td>
      <td>
        Máy chủ đang chấm dứt kết nối vì nó đang khởi động lại.
      </td>
    </tr>
    <tr>
      <td><code>1013</code></td>
      <td><a href="https://mailarchive.ietf.org/arch/msg/hybi/P_1vbD9uyHl63nbIIbFxKMfSwcM/">Thử lại sau</a></td>
      <td>
        Máy chủ đang chấm dứt kết nối do một điều kiện tạm thời, ví dụ nó đang
        quá tải và đang ngắt bớt một số client.
      </td>
    </tr>
    <tr>
      <td><code>1014</code></td>
      <td><a href="https://mailarchive.ietf.org/arch/msg/hybi/VOLI2xp4tzFnIFYespe6oOtpFXA/">Cổng kết nối lỗi</a></td>
      <td>
        Máy chủ đang hoạt động như một gateway hoặc proxy và đã nhận được phản
        hồi không hợp lệ từ máy chủ thượng nguồn. Điều này tương tự với mã
        trạng thái HTTP 502.
      </td>
    </tr>
    <tr>
      <td><code>1015</code></td>
      <td>Bắt tay TLS</td>
      <td>
        <strong>Được dành riêng.</strong> Cho biết kết nối bị đóng do không thể
        thực hiện bắt tay TLS (ví dụ: không thể xác minh chứng chỉ máy chủ).
      </td>
    </tr>
    <tr>
      <td><code>1016</code>–<code>2999</code></td>
      <td></td>
      <td>
        Dành cho việc định nghĩa bởi các bản sửa đổi trong tương lai của đặc tả
        WebSocket Protocol, và bởi các đặc tả phần mở rộng.
      </td>
    </tr>
    <tr>
      <td><code>3000</code>–<code>3999</code></td>
      <td></td>
      <td>
        Dành cho thư viện, framework và ứng dụng sử dụng. Các mã trạng thái này
        được <a href="https://www.iana.org/assignments/websocket/websocket.xml#close-code-number">đăng ký trực tiếp với IANA</a>. Cách diễn giải các mã này không được giao thức WebSocket định nghĩa.
      </td>
    </tr>
    <tr>
      <td><code>4000</code>–<code>4999</code></td>
      <td></td>
      <td>
        Dành cho sử dụng riêng tư nên không thể đăng ký. Các mã như vậy có thể
        được dùng theo thỏa thuận trước giữa các ứng dụng WebSocket. Cách diễn
        giải các mã này không được giao thức WebSocket định nghĩa.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

Ví dụ sau ghi giá trị của `code` ra console.

```js
WebSocket.onclose = (event) => {
  console.log(event.code);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [RFC 6455](https://www.rfc-editor.org/rfc/rfc6455.html) (đặc tả WebSocket Protocol)
- [WebSocket Close Code Number Registry](https://www.iana.org/assignments/websocket/websocket.xml#close-code-number) (IANA)
