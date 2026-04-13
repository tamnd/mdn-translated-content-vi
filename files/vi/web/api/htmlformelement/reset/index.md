---
title: "HTMLFormElement: phương thức reset()"
short-title: reset()
slug: Web/API/HTMLFormElement/reset
page-type: web-api-instance-method
browser-compat: api.HTMLFormElement.reset
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLFormElement.reset()`** khôi phục các giá trị mặc định của phần tử biểu mẫu. Phương thức này thực hiện chức năng tương tự như việc nhấp vào điều khiển [`<input type="reset">`](/en-US/docs/Web/HTML/Reference/Elements/input/reset) của biểu mẫu.

Nếu một điều khiển biểu mẫu (chẳng hạn như nút reset) có tên hoặc id là _reset_ thì nó sẽ che khuất phương thức reset của biểu mẫu. Nó không đặt lại các thuộc tính khác trong input, chẳng hạn như `disabled`.

Lưu ý rằng nếu {{domxref("Element.setAttribute", "setAttribute()")}} được gọi để đặt giá trị của một thuộc tính cụ thể, lệnh gọi `reset()` tiếp theo sẽ không đặt lại thuộc tính về giá trị mặc định của nó, mà thay vào đó sẽ giữ thuộc tính ở bất kỳ giá trị nào mà lệnh gọi {{domxref("Element.setAttribute", "setAttribute()")}} đã đặt.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
document.getElementById("my-form").reset();
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
