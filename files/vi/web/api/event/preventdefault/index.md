---
title: "Event: phương thức preventDefault()"
short-title: preventDefault()
slug: Web/API/Event/preventDefault
page-type: web-api-instance-method
browser-compat: api.Event.preventDefault
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`preventDefault()`** của giao diện {{domxref("Event")}} báo cho {{Glossary("user agent")}} biết rằng sự kiện đang được xử lý một cách tường minh, vì vậy hành động mặc định của nó, chẳng hạn cuộn trang, điều hướng liên kết, hoặc dán văn bản, không nên được thực hiện.

Sự kiện vẫn tiếp tục lan truyền như bình thường,
trừ khi một trong các bộ lắng nghe sự kiện của nó gọi
{{domxref("Event.stopPropagation", "stopPropagation()")}}
hoặc {{domxref("Event.stopImmediatePropagation", "stopImmediatePropagation()")}},
và một trong hai hàm đó sẽ dừng việc lan truyền ngay lập tức.

Như đã lưu ý bên dưới, việc gọi **`preventDefault()`** cho một
sự kiện không thể bị hủy, chẳng hạn sự kiện được gửi đi qua
{{domxref("EventTarget.dispatchEvent()")}}, mà không chỉ định
`cancelable: true` sẽ không có tác dụng.

Nếu một bộ lắng nghe thụ động gọi `preventDefault()`, sẽ không có gì xảy ra và có thể sinh ra cảnh báo trên console.

> [!NOTE]
> Hãy tìm các phương án tốt hơn thay vì dùng `preventDefault()` để chặn hành động mặc định. Ví dụ, bạn có thể dùng thuộc tính `disabled` hoặc `readonly` trên một điều khiển biểu mẫu để ngăn nó được tương tác, dùng [xác thực ràng buộc HTML](/en-US/docs/Web/HTML/Guides/Constraint_validation) để từ chối dữ liệu đầu vào không hợp lệ, hoặc dùng thuộc tính {{cssxref("overflow")}} để ngăn cuộn.

## Cú pháp

```js-nolint
preventDefault()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Chặn hành vi nhấp mặc định

Việc bật hoặc tắt một checkbox là hành động mặc định khi nhấp vào nó. Ví dụ này
minh họa cách ngăn điều đó xảy ra:

#### JavaScript

```js
const checkbox = document.querySelector("#id-checkbox");

checkbox.addEventListener("click", checkboxClick);

function checkboxClick(event) {
  const warn = "preventDefault() sẽ không cho bạn tick ô này!\n";
  document.getElementById("output-box").innerText += warn;
  event.preventDefault();
}
```

#### HTML

```html
<p>Vui lòng nhấp vào điều khiển checkbox.</p>

<form>
  <label for="id-checkbox">Checkbox:</label>
  <input type="checkbox" id="id-checkbox" />
</form>

<div id="output-box"></div>
```

#### Kết quả

{{EmbedLiveSample("Blocking_default_click_handling")}}

## Ghi chú

Việc gọi `preventDefault()` trong bất kỳ giai đoạn nào của luồng sự kiện đều hủy sự kiện,
nghĩa là mọi hành động mặc định mà phần cài đặt thường thực hiện do sự kiện đó sẽ không xảy ra.

Bạn có thể dùng {{domxref("Event.cancelable")}} để kiểm tra sự kiện có thể bị hủy hay không.
Gọi `preventDefault()` cho một sự kiện không thể bị hủy sẽ không có tác dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
