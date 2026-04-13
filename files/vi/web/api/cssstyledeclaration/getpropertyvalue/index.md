---
title: "CSSStyleDeclaration: phương thức getPropertyValue()"
short-title: getPropertyValue()
slug: Web/API/CSSStyleDeclaration/getPropertyValue
page-type: web-api-instance-method
browser-compat: api.CSSStyleDeclaration.getPropertyValue
---

{{ APIRef("CSSOM") }}

Phương thức giao diện **CSSStyleDeclaration.getPropertyValue()** trả về một chuỗi chứa giá trị của một thuộc tính CSS được chỉ định.

## Cú pháp

```js-nolint
getPropertyValue(property)
```

### Tham số

- `property`
  - : Một chuỗi đại diện cho tên thuộc tính (ở dạng hyphen case) cần kiểm tra.

### Giá trị trả về

Một chuỗi chứa giá trị của thuộc tính. Nếu không được thiết lập, trả về chuỗi rỗng.

Giá trị thuộc tính được tính toán động, không phải giá trị ban đầu được chỉ định trong khai báo. Quá trình tuần tự hóa xảy ra theo cách sau:

- Nếu `property` là một thuộc tính shorthand, thì lấy tất cả các thuộc tính longhand mà nó tương ứng. Lưu ý rằng các thuộc tính shorthand được chỉ định trong bảng kiểu ban đầu đã được mở rộng trong thời gian phân tích cú pháp. Nếu ít nhất một trong những thuộc tính longhand đó không được khai báo, hoặc trạng thái `!important` của chúng khác nhau, thì kết quả là chuỗi rỗng. Nếu không, một giá trị thuộc tính mở rộng thành cùng danh sách giá trị thuộc tính longhand sẽ được trả về, và giá trị shorthand này sẽ lược bỏ nhiều thành phần nhất có thể, và được sắp xếp lại để khớp với thứ tự chuẩn trong định nghĩa chính thức nếu có thể. Nếu một trong các bản dịch cú pháp trên ít tương thích ngược hơn, thì không thực hiện chúng.
- Nếu không, thuộc tính được tuần tự hóa theo kiểu dữ liệu của nó. Mỗi kiểu dữ liệu có một biểu diễn chuẩn; ví dụ: các giá trị `<color>` luôn sử dụng `rgb(R, G, B)` hoặc `rgba(R, G, B, A)`.

Về cơ bản, giá trị thuộc tính được _chuẩn hóa_, đảm bảo rằng hai giá trị thuộc tính có cùng hiệu ứng kết xuất sẽ so sánh bằng nhau ngay cả khi chúng được khai báo khác nhau.

## Ví dụ

Mã JavaScript sau đây truy vấn giá trị của thuộc tính `margin` trong một quy tắc bộ chọn CSS:

```js
const declaration = document.styleSheets[0].cssRules[0].style;
const value = declaration.getPropertyValue("margin"); // "1px 2px"
```

Chuỗi được trả về có thể khác với giá trị được chỉ định trong đặc tả kiểu của phần tử. Ví dụ, kiểu sau:

```css
p#blueish {
  color: hsl(250 90 50);
}
```

```js
const declaration = document.styleSheets[0].cssRules[0].style;
const value = declaration.getPropertyValue("color");
```

Sẽ đặt giá trị `rgb(51, 13, 242);`. Điều này quan trọng khi so sánh các kiểu bằng chuỗi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
