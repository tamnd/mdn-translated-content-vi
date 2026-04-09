---
title: Badging API
slug: Web/API/Badging_API
page-type: web-api-overview
browser-compat: api.Navigator.setAppBadge
---

{{DefaultAPISidebar("Badging API")}}{{securecontext_header}}{{AvailableInWorkers}}

**Badging API** cung cấp cho nhà phát triển web một cách để đặt huy hiệu trên tài liệu hoặc ứng dụng, đóng vai trò như một thông báo rằng trạng thái đã thay đổi mà không cần hiển thị một thông báo gây xao nhãng hơn. Một trường hợp sử dụng phổ biến là ứng dụng có tính năng nhắn tin hiển thị huy hiệu trên biểu tượng ứng dụng để cho biết có tin nhắn mới.

## Khái niệm và cách dùng

Nhà phát triển web thường xuyên cập nhật favicon hoặc tiêu đề của tài liệu để biểu thị trạng thái. Badging API cung cấp một cách thanh lịch hơn để hiển thị trạng thái, bằng cách cung cấp một phương thức có ý nghĩa đối với user agent và do đó có thể được hiển thị theo cách phù hợp với phần còn lại của giao diện người dùng.

### Các loại huy hiệu

Có hai loại huy hiệu:

- Huy hiệu tài liệu, thường được hiển thị trong tab trình duyệt gần biểu tượng trang hoặc chồng lên biểu tượng đó.
- Huy hiệu ứng dụng, được gắn với biểu tượng của một ứng dụng web đã cài đặt. Chúng có thể hiển thị trên biểu tượng ứng dụng trong dock, shelf hoặc màn hình chính, tùy thuộc vào thiết bị đang được sử dụng.

### Trạng thái huy hiệu

Huy hiệu có thể mang một trong ba giá trị khả dĩ, được đặt nội bộ:

- `nothing`
  - : Cho biết hiện tại không có huy hiệu nào được đặt. Huy hiệu có thể ở trạng thái này do bị ứng dụng xóa hoặc do user agent đặt lại.
- `flag`
  - : Cho biết huy hiệu đã được đặt, nhưng không có dữ liệu cụ thể nào để hiển thị. Huy hiệu sẽ ở trạng thái này nếu ứng dụng đã đặt huy hiệu nhưng không truyền giá trị nào cho phương thức.
- một số nguyên
  - : Giá trị được truyền khi đặt huy hiệu. Giá trị này sẽ không bao giờ là `0`; truyền giá trị `0` khi đặt huy hiệu sẽ khiến user agent xóa huy hiệu bằng cách đặt nó về `nothing`.

### Đặt huy hiệu

Huy hiệu được đặt bằng các phương thức `setAppBadge()` (đối với ứng dụng đã cài đặt). Nếu không truyền tham số nào cho các phương thức này thì giá trị huy hiệu sẽ là flag. User agent sẽ hiển thị huy hiệu thông báo của nó, chẳng hạn như một vòng tròn có màu trên biểu tượng.

Các phương thức này cũng có thể nhận tham số `contents`, tham số này phải là một số. Giá trị đó sau đó sẽ được hiển thị như một phần của huy hiệu. User agent có thể thay đổi giá trị này theo một cách nào đó. Ví dụ, nếu bạn truyền một số rất lớn như 4000, user agent có thể hiển thị giá trị này là 99+ trong huy hiệu. User agent cũng có thể bỏ qua dữ liệu này và hiển thị một dấu chỉ báo thay thế.

### Xóa huy hiệu

Huy hiệu được xóa bằng các phương thức `clearAppBadge()`. Những phương thức này không nhận tham số nào và đặt huy hiệu về giá trị `nothing`. Ngoài ra, truyền giá trị `0` cho `setAppBadge()` sẽ đặt huy hiệu về `nothing` và xóa huy hiệu.

## Giao diện

Không có.

### Phần mở rộng của giao diện Navigator

- {{domxref("Navigator.setAppBadge()")}}
  - : Đặt huy hiệu trên biểu tượng được liên kết với ứng dụng này.
- {{domxref("Navigator.clearAppBadge()")}}
  - : Xóa huy hiệu trên biểu tượng được liên kết với ứng dụng này.

### Phần mở rộng của giao diện WorkerNavigator

- {{domxref("WorkerNavigator.setAppBadge()")}}
  - : Đặt huy hiệu trên biểu tượng được liên kết với ứng dụng này.
- {{domxref("WorkerNavigator.clearAppBadge()")}}
  - : Xóa huy hiệu trên biểu tượng được liên kết với ứng dụng này.

## Ví dụ

Để đặt huy hiệu thông báo trên ứng dụng hiện tại với giá trị là 12:

```js
navigator.setAppBadge(12);
```

Để xóa huy hiệu thông báo trên ứng dụng hiện tại:

```js
navigator.clearAppBadge();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Badging for app icons](https://developer.chrome.com/docs/capabilities/web-apis/badging-api)
- [Badging API Explainer](https://github.com/w3c/badging/blob/main/explainer.md)
