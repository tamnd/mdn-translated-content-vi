---
title: "ARIA: vai trò alert"
short-title: alert
slug: Web/Accessibility/ARIA/Reference/Roles/alert_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#alert
sidebar: accessibilitysidebar
---

Vai trò `alert` dành cho thông tin quan trọng, và thường là thông tin cần được chú ý ngay. `alert` là một dạng [`status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role) được xử lý như một vùng trực tiếp nguyên tử.

## Mô tả

Vai trò `alert` được dùng để truyền đạt một thông điệp quan trọng và thường cần chú ý ngay cho người dùng. Khi vai trò này được thêm vào một phần tử, trình duyệt sẽ gửi ra một sự kiện cảnh báo có thể truy cập tới các sản phẩm công nghệ hỗ trợ, rồi chúng có thể thông báo cho người dùng.

Vai trò alert chỉ nên được dùng cho thông tin đòi hỏi người dùng chú ý ngay, ví dụ:

- Một giá trị không hợp lệ đã được nhập vào một trường biểu mẫu
- Phiên đăng nhập của người dùng sắp hết hạn
- Kết nối tới máy chủ bị mất nên các thay đổi cục bộ sẽ không được lưu

Vai trò `alert` chỉ nên được dùng cho nội dung văn bản, không dùng cho các phần tử tương tác như liên kết hoặc nút. Phần tử có vai trò `alert` không nhất thiết phải nhận tiêu điểm được, vì trình đọc màn hình (giọng nói hoặc chữ nổi) sẽ tự động đọc nội dung đã cập nhật bất kể tiêu điểm bàn phím đang ở đâu khi vai trò được thêm vào.

Vai trò `alert` được thêm vào nút chứa thông điệp cảnh báo, **không phải** phần tử gây ra cảnh báo. Các alert là [vùng trực tiếp mang tính khẳng định](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions). Việc đặt `role="alert"` tương đương với đặt [`aria-live="assertive"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) và [`aria-atomic="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic). Vì chúng không nhận tiêu điểm, không cần quản lý tiêu điểm và cũng không nên yêu cầu tương tác của người dùng.

> [!WARNING]
> Vì tính chất gây gián đoạn của nó, vai trò `alert` phải được dùng tiết chế và chỉ trong các tình huống cần người dùng chú ý ngay lập tức.

Vai trò [`alert`](https://w3c.github.io/aria/#alert) là một trong năm vai trò [vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions). Các thay đổi động ít khẩn cấp hơn nên dùng phương pháp ít mạnh hơn, chẳng hạn thêm `aria-live="polite"` hoặc dùng một vai trò vùng trực tiếp khác như [`status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role). Nếu dự kiến người dùng sẽ đóng cảnh báo, hãy dùng vai trò [`alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role) thay thế.

Điều quan trọng nhất cần biết về vai trò `alert` là nó dành cho nội dung được hiển thị động, không phải nội dung xuất hiện khi tải trang. Nó rất phù hợp cho các tình huống như khi người dùng điền biểu mẫu và JavaScript được dùng để thêm thông báo lỗi - alert sẽ đọc ngay thông điệp đó. Nó không nên được dùng cho HTML mà người dùng chưa tương tác. Ví dụ, nếu một trang tải lên với nhiều cảnh báo hiển thị rải rác, thì không nên dùng vai trò alert, vì các thông điệp đó không được kích hoạt động.

Giống như tất cả các [vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) khác, các alert chỉ được thông báo khi nội dung của phần tử có `role="alert"` được _cập nhật_. Hãy bảo đảm phần tử có vai trò này đã có mặt trong markup của trang trước - điều này sẽ "khởi động" trình duyệt và trình đọc màn hình để tiếp tục theo dõi phần tử đó tìm thay đổi. Sau đó, bất kỳ thay đổi nào trong nội dung sẽ được thông báo. Đừng cố thêm/tạo động một phần tử có `role="alert"` mà bên trong đã được điền sẵn thông điệp cảnh báo bạn muốn đọc - điều đó thường _không_ dẫn đến thông báo, vì đó không phải là thay đổi nội dung.

Vì vai trò `alert` đọc ra bất kỳ nội dung nào đã thay đổi, nó nên được dùng cẩn thận. Theo định nghĩa, alerts là gây gián đoạn. Nhiều alert cùng lúc, và các alert không cần thiết, sẽ tạo ra trải nghiệm người dùng tệ.

## Ví dụ

Sau đây là các ví dụ phổ biến về alert và cách triển khai chúng:

### Ví dụ 1: Làm cho nội dung có sẵn bên trong một phần tử có vai trò alert trở nên hiển thị

Nếu nội dung _bên trong_ phần tử có `role="alert"` ban đầu bị ẩn bằng CSS, việc làm cho nó hiển thị sẽ kích hoạt alert. Điều này có nghĩa là một phần tử vùng chứa alert hiện có có thể được "tái sử dụng" nhiều lần.

```css
.hidden {
  display: none;
}
```

```html
<div id="expirationWarning" role="alert">
  <span class="hidden">Phiên đăng nhập của bạn sẽ hết hạn sau 2 phút</span>
</div>
```

```js
// xóa lớp 'hidden' sẽ làm nội dung bên trong phần tử hiển thị, và trình đọc màn hình sẽ đọc cảnh báo:
document
  .getElementById("expirationWarning")
  .firstChild.classList.remove("hidden");
```

### Ví dụ 2: Thay đổi động nội dung bên trong một phần tử có vai trò alert

Bằng JavaScript, bạn có thể thay đổi động nội dung _bên trong_ phần tử có `role="alert"`. Lưu ý rằng nếu bạn cần kích hoạt cùng một alert nhiều lần (tức là nội dung bạn chèn động giống như lần trước), điều đó thường sẽ không được xem là thay đổi và sẽ _không_ dẫn đến thông báo. Vì lý do này, thường tốt nhất là tạm thời "xóa sạch" nội dung của vùng chứa alert trước rồi mới chèn thông điệp cảnh báo.

```html
<div id="alertContainer" role="alert"></div>
```

```js
// xóa nội dung của vùng chứa
document.getElementById("alertContainer").textContent = "";
// chèn thông điệp cảnh báo mới
document.getElementById("alertContainer").textContent =
  `Phiên của bạn sẽ hết hạn sau ${expiration} phút`;
```

### Ví dụ 3: Vùng chứa alert bị ẩn bằng hình ảnh cho thông báo của trình đọc màn hình

Có thể ẩn phần tử vùng chứa alert bằng hình ảnh, và dùng nó để cung cấp cập nhật/thông báo trực tiếp cho trình đọc màn hình. Điều này có thể hữu ích trong những tình huống nội dung quan trọng trên trang đã được cập nhật, nhưng thay đổi đó chưa chắc đã rõ ràng ngay với người dùng trình đọc màn hình.

Tuy nhiên, hãy bảo đảm vùng chứa không bị ẩn bằng `display:none`, vì điều đó sẽ ẩn nó ngay cả với công nghệ hỗ trợ, nghĩa là chúng sẽ không được thông báo về bất kỳ thay đổi nào. Thay vào đó, hãy dùng thứ gì đó như các kiểu [`.visually-hidden`](https://www.a11yproject.com/posts/how-to-hide-content/).

```html
<div id="hiddenAlertContainer" role="alert" class="visually-hidden"></div>
```

```css
.visually-hidden {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```

```js
// xóa nội dung của vùng chứa
document.getElementById("hiddenAlertContainer").textContent = "";
// chèn thông điệp cảnh báo mới
document.getElementById("hiddenAlertContainer").textContent =
  "Tất cả các mục đã bị xóa khỏi kho của bạn.";
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
- [vai trò `log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [vai trò `marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [vai trò `status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [vai trò `timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)
- [vai trò `alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [ARIA: vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
- [Hỗ trợ ARIA alert - Vispero](https://vispero.com/resources/aria-alert-support/)
- [Ví dụ alert của ARIA Practices](https://www.w3.org/WAI/ARIA/apg/patterns/alert/examples/alert/)
