---
title: "HTMLImageElement: decode() method"
short-title: decode()
slug: Web/API/HTMLImageElement/decode
page-type: web-api-instance-method
browser-compat: api.HTMLImageElement.decode
---

{{APIRef("HTML DOM")}}

Phương thức **`decode()`** của giao diện {{domxref("HTMLImageElement")}} trả về {{jsxref("Promise")}} sẽ phân giải sau khi hình ảnh được giải mã và an toàn để thêm vào DOM.

Điều này có thể được sử dụng để bắt đầu tải hình ảnh trước khi gắn nó vào một phần tử trong DOM (hoặc thêm nó vào DOM dưới dạng một phần tử mới), để hình ảnh có thể được hiển thị ngay lập tức khi được thêm vào DOM. Ngược lại, điều này sẽ ngăn việc hiển thị khung tiếp theo sau khi thêm hình ảnh vào DOM gây ra độ trễ trong khi tải hình ảnh.

## Cú pháp

```js-nolint
decode()
```

### Thông số

Không có.

### Giá trị trả về

{{jsxref('Promise')}} đáp ứng `undefined` khi dữ liệu hình ảnh đã sẵn sàng để sử dụng.

### Ngoại lệ

- `EncodingError` {{domxref("DOMException")}}
  - : Đã xảy ra lỗi khi giải mã hình ảnh. Điều này có thể xảy ra nếu:
    - Yêu cầu không thành công
    - Yêu cầu hình ảnh đã thay đổi sau khi gọi `decode()` (ví dụ: bằng cách thay đổi `src`)
    - Dữ liệu của hình ảnh bị hỏng

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ sau đây cho thấy cách sử dụng phương thức `decode()` để kiểm soát khi nào
một hình ảnh được thêm vào DOM.

```js
const img = new Image();
img.src = "nebula.jpg";
img
  .decode()
  .then(() => {
    document.body.appendChild(img);
  })
  .catch((encodingError) => {
    // Do something with the error.
  });
```

> [!NOTE]
> Nếu không có phương thức trả về {{jsxref('Promise')}}, bạn sẽ thêm hình ảnh vào DOM trong trình xử lý sự kiện {{domxref("Window/load_event", "load")}} và xử lý lỗi trong trình xử lý sự kiện {{domxref("HTMLElement/error_event", "error")}}.

### Tránh hình ảnh trống

Trong ví dụ bên dưới, bạn có thể sẽ thấy một hình ảnh trống hiển thị trên trang khi hình ảnh được tải xuống:

```js
const img = new Image();
img.src = "img/logo.png";
document.body.appendChild(img);
```

Việc sử dụng `decode()` sẽ trì hoãn việc chèn hình ảnh vào DOM cho đến khi nó được tải xuống và giải mã đầy đủ, từ đó tránh được vấn đề hình ảnh trống:

```js
async function getImage() {
  const img = new Image();
  img.src = "img/logo.png";
  await img.decode();
  document.body.appendChild(img);
  const p = document.createElement("p");
  p.textContent = "Image is fully loaded!";
  document.body.appendChild(p);
}
```

Điều này đặc biệt hữu ích nếu bạn đang tự động hoán đổi một hình ảnh hiện có cho một hình ảnh mới và cũng ngăn không cho các phần sơn không liên quan bên ngoài mã này bị giữ lại trong khi hình ảnh đang được giải mã. Ví dụ: trong album ảnh trực tuyến, ban đầu bạn có thể hiển thị hình thu nhỏ có độ phân giải thấp, sau đó thay thế hình ảnh đó bằng hình ảnh có độ phân giải đầy đủ bằng cách tạo một {{domxref("HTMLImageElement")}} mới, đặt nguồn của nó thành URL của hình ảnh có độ phân giải đầy đủ, sau đó sử dụng `decode()` để nhận được lời hứa được giải quyết sau khi hình ảnh có độ phân giải đầy đủ sẵn sàng để sử dụng. Vào thời điểm đó, bạn có thể thay thế hình ảnh có độ phân giải thấp bằng hình ảnh có độ phân giải đầy đủ hiện có.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính giải mã hình ảnh thực chất có tác dụng gì?](https://www.tunetheweb.com/blog/what-does-the-image-decoding-attribute-actually-do/) trên tunetheweb.com (2023)
- Thuộc tính {{domxref("HTMLImageElement.decoding")}}
