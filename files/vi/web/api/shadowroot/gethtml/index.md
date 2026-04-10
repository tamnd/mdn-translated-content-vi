---
title: "ShadowRoot: phương thức getHTML()"
short-title: getHTML()
slug: Web/API/ShadowRoot/getHTML
page-type: web-api-instance-method
browser-compat: api.ShadowRoot.getHTML
---

{{APIRef("DOM")}}

Phương thức **`getHTML()`** của giao diện {{domxref("ShadowRoot")}} được dùng để tuần tự hóa DOM của một shadow root thành một chuỗi HTML.

Phương thức này cung cấp một đối số tùy chọn cho phép tuần tự hóa các nút con là shadow root. Các tùy chọn có thể được dùng để bao gồm các shadow root lồng nhau đã được đặt là {{domxref("ShadowRoot/serializable","serializable")}}, và/hoặc một mảng chỉ định gồm các đối tượng {{domxref("ShadowRoot")}}, có thể là open hoặc closed.

Nếu không có đối số, các nút con là shadow root sẽ không được tuần tự hóa, và phương thức này hoạt động giống như việc đọc giá trị của {{domxref("Element.innerHTML")}}.

Lưu ý rằng một số trình duyệt tuần tự hóa các ký tự `<` và `>` thành `&lt;` và `&gt;` khi chúng xuất hiện trong giá trị thuộc tính (xem [Tương thích trình duyệt](#browser_compatibility)). Điều này nhằm ngăn một lỗ hổng bảo mật tiềm tàng ([mutation XSS](https://www.securitum.com/mutation-xss-via-mathml-mutation-dompurify-2-0-17-bypass.html)) trong đó kẻ tấn công có thể tạo dữ liệu đầu vào bỏ qua một [hàm làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization), dẫn đến tấn công cross-site scripting (XSS).

## Cú pháp

```js-nolint
getHTML(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các tham số tùy chọn sau:
    - `serializableShadowRoots`
      - : Giá trị boolean chỉ định có bao gồm các shadow root [có thể tuần tự hóa](/en-US/docs/Web/API/ShadowRoot/serializable) hay không. Giá trị mặc định là `false`.
    - `shadowRoots`
      - : Một mảng các đối tượng {{domxref("ShadowRoot")}} cần được tuần tự hóa. Chúng được bao gồm bất kể chúng có được đánh dấu là `serializable` hay không, hoặc là open hay closed. Giá trị mặc định là một mảng rỗng.

### Giá trị trả về

Một chuỗi biểu diễn quá trình tuần tự hóa HTML của shadow root.

### Ngoại lệ

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.getHTML()")}}
- {{domxref("Element.innerHTML")}}
- {{domxref("ShadowRoot.setHTMLUnsafe()")}}
- {{domxref("Element.setHTMLUnsafe()")}}
