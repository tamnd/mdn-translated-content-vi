---
title: "DOMTokenList: phương thức toggle()"
short-title: toggle()
slug: Web/API/DOMTokenList/toggle
page-type: web-api-instance-method
browser-compat: api.DOMTokenList.toggle
---

{{APIRef("DOM")}}

Phương thức **`toggle()`** của giao diện {{domxref("DOMTokenList")}}
xóa một token hiện có khỏi danh sách và trả về `false`.
Nếu token không tồn tại, nó sẽ được thêm vào và hàm trả về `true`.

## Cú pháp

```js-nolint
toggle(token)
toggle(token, force)
```

### Tham số

- `token`
  - : Một chuỗi biểu thị token mà bạn muốn chuyển trạng thái.
- `force` {{optional_inline}}
  - : Nếu được bao gồm, sẽ biến thao tác toggle thành thao tác một chiều.
    Nếu đặt là `false`, thì `token` sẽ _chỉ_ bị xóa, nhưng không được thêm.
    Nếu đặt là `true`, thì `token` sẽ _chỉ_ được thêm, nhưng không bị xóa.

### Giá trị trả về

Một giá trị boolean, `true` hoặc `false`, cho biết `token` có nằm trong danh sách sau khi gọi hay không.

## Ví dụ

### Chuyển trạng thái một lớp khi nhấp

Trong ví dụ sau, chúng ta lấy danh sách các lớp được đặt trên một
phần tử {{htmlelement("span")}} dưới dạng `DOMTokenList` bằng
{{domxref("Element.classList")}}. Sau đó chúng ta thay thế một token trong danh sách, rồi ghi
danh sách vào {{domxref("Node.textContent")}} của thẻ `<span>`.

Trước hết là HTML:

```html
<span class="a b">classList is 'a b'</span>
```

Bây giờ là JavaScript:

```js
const span = document.querySelector("span");
const classes = span.classList;

span.addEventListener("click", () => {
  const result = classes.toggle("c");
  span.textContent = `'c' ${
    result ? "added" : "removed"
  }; classList is now "${classes}".`;
});
```

Kết quả sẽ như sau và sẽ thay đổi mỗi khi bạn nhấp vào văn bản:

{{ EmbedLiveSample('Toggling_a_class_on_click', '100%', 60) }}

### Thiết lập tham số force

Tham số thứ hai có thể được dùng để xác định lớp có được bao gồm hay không. Ví dụ này sẽ chỉ bao gồm lớp 'c' nếu cửa sổ trình duyệt rộng hơn 1000 pixel:

```js
span.classList.toggle("c", window.innerWidth > 1000);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
