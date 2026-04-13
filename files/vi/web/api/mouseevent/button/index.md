---
title: "MouseEvent: button property"
short-title: button
slug: Web/API/MouseEvent/button
page-type: web-api-instance-property
browser-compat: api.MouseEvent.button
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`MouseEvent.button`** cho biết nút nào được nhấn hoặc nhả trên chuột để kích hoạt sự kiện.

Thuộc tính này chỉ đảm bảo cho biết nút nào được nhấn hoặc nhả trong các sự kiện do nhấn hoặc nhả một hoặc nhiều nút.
Do đó, nó không đáng tin cậy đối với các sự kiện như {{domxref("Element/mouseenter_event", "mouseenter")}}, {{domxref("Element/mouseleave_event", "mouseleave")}}, {{domxref("Element/mouseover_event", "mouseover")}}, {{domxref("Element/mouseout_event", "mouseout")}} hoặc {{domxref("Element/mousemove_event", "mousemove")}}.

Người dùng có thể thay đổi cấu hình các nút trên thiết bị trỏ của họ để nếu thuộc tính nút của sự kiện bằng 0 thì nguyên nhân có thể không phải do nút nằm ở bên trái nhiều nhất trên thiết bị trỏ; tuy nhiên, nó sẽ hoạt động như thể nút bên trái được nhấp vào trong bố cục nút tiêu chuẩn.

> [!NOTE]
> Đừng nhầm lẫn thuộc tính này với thuộc tính {{domxref("MouseEvent.buttons")}}, thuộc tính này cho biết nút nào được nhấn cho tất cả các loại sự kiện chuột.

## Giá trị

Một số đại diện cho một nút nhất định:

- `0`: Nút chính, thường là nút bên trái hoặc chưa được khởi tạo
  tình trạng
- `1`: Nút phụ, thường là nút bánh xe hoặc ở giữa
  nút (nếu có)
- `2`: Nút phụ, thường là nút bên phải
- `3`: Nút thứ tư, điển hình là nút _Quay lại trình duyệt_
- `4`: Nút thứ năm, điển hình là nút _Chuyển tiếp trình duyệt_

Như đã lưu ý ở trên, các nút có thể được định cấu hình khác với bố cục "từ trái sang phải" tiêu chuẩn.
Chuột được cấu hình để sử dụng bằng tay trái có thể đảo ngược thao tác của nút.
Một số thiết bị trỏ chỉ có một nút bấm và sử dụng bàn phím hoặc các cơ chế nhập liệu khác để biểu thị chính, phụ, phụ, v.v.
Những người khác có thể có nhiều nút được ánh xạ tới các chức năng và giá trị nút khác nhau.

## Ví dụ

### HTML

```html
<button id="button">Click here with your mouse…</button>
<p id="log"></p>
```

### JavaScript

```js
const button = document.querySelector("#button");
const log = document.querySelector("#log");
button.addEventListener("mouseup", (e) => {
  switch (e.button) {
    case 0:
      log.textContent = "Left button clicked.";
      break;
    case 1:
      log.textContent = "Middle button clicked.";
      break;
    case 2:
      log.textContent = "Right button clicked.";
      break;
    default:
      log.textContent = `Unknown button code: ${e.button}`;
  }
});
button.addEventListener("contextmenu", (e) => {
  e.preventDefault();
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent")}}
