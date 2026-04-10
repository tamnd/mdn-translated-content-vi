---
title: "Window: phương thức alert()"
short-title: alert()
slug: Web/API/Window/alert
page-type: web-api-instance-method
browser-compat: api.Window.alert
---

{{ APIRef }}

`window.alert()` yêu cầu trình duyệt hiển thị một hộp thoại với thông điệp tùy chọn và đợi cho đến khi người dùng đóng hộp thoại.

Trong một số điều kiện — ví dụ: khi người dùng chuyển tab — trình duyệt có thể không hiển thị hộp thoại hoặc có thể không đợi người dùng đóng hộp thoại.

## Cú pháp

```js-nolint
alert()
alert(message)
```

### Tham số

- `message` {{optional_inline}}
  - : Một chuỗi bạn muốn hiển thị trong hộp thoại cảnh báo, hoặc một đối tượng được
    chuyển đổi thành chuỗi và hiển thị.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
window.alert("Hello world!");
alert("Hello world!");
```

Cả hai đều tạo ra:

![Hộp thoại cảnh báo màu đen. Bên trái phía trên là biểu tượng hình tròn nhỏ theo sau là cặp ngoặc vuông mở và đóng màu trắng chứa dòng chữ trắng: JavaScript application. Phía dưới bên trái là dòng chữ Hello world! màu trắng. Và góc dưới bên phải là nút nhỏ màu xanh. Văn bản trên nút là: ok màu đen.](alerthelloworld.png)

## Ghi chú

Hộp thoại cảnh báo nên được sử dụng cho các thông điệp không yêu cầu bất kỳ phản hồi nào từ
người dùng, ngoài việc xác nhận thông điệp.

Hộp thoại là cửa sổ modal - chúng
ngăn người dùng truy cập phần còn lại của giao diện chương trình cho đến khi hộp thoại
được đóng. Vì lý do này, bạn không nên lạm dụng bất kỳ hàm nào tạo ra hộp thoại
(hoặc cửa sổ modal).

Ngoài ra, có thể sử dụng phần tử {{HTMLElement("dialog")}} để hiển thị cảnh báo.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("dialog")}}
- {{domxref("window.confirm","confirm")}}
- {{domxref("window.prompt","prompt")}}
