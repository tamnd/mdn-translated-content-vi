---
title: "MouseEvent: buttons property"
short-title: buttons
slug: Web/API/MouseEvent/buttons
page-type: web-api-instance-property
browser-compat: api.MouseEvent.buttons
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`MouseEvent.buttons`** cho biết nút nào được nhấn trên chuột (hoặc thiết bị đầu vào khác) khi sự kiện chuột được kích hoạt.

Mỗi nút có thể nhấn được biểu thị bằng một số nhất định (xem bên dưới).
Nếu nhấn nhiều nút, các giá trị của nút sẽ được cộng lại với nhau để tạo ra một số mới.
Ví dụ: nếu nhấn đồng thời các nút phụ (`2`) và phụ (`4`), giá trị sẽ là `6` (tức là `2 + 4`).

> [!NOTE]
> Đừng nhầm lẫn thuộc tính này với thuộc tính {{domxref("MouseEvent.button")}}.
> Thuộc tính `MouseEvent.buttons` cho biết trạng thái của các nút được nhấn trong bất kỳ loại sự kiện chuột nào,
> trong khi thuộc tính {{domxref("MouseEvent.button")}} chỉ đảm bảo giá trị chính xác cho các sự kiện chuột xảy ra do nhấn hoặc nhả một hoặc nhiều nút.

## Giá trị

Một số đại diện cho một hoặc nhiều nút.
Khi nhấn đồng thời nhiều nút, các giá trị sẽ được kết hợp (ví dụ: `3` là chính + phụ).

- `0`: Không có nút hoặc chưa được khởi tạo
- `1`: Nút chính (thường là nút bên trái)
- `2`: Nút phụ (thường là nút bên phải)
- `4`: Nút phụ (thường là nút lăn chuột hoặc nút giữa
  cái nút)
- `8`: Nút thứ 4 (thường là nút "Quay lại trình duyệt")
- `16` : Nút thứ 5 (thường là nút "Chuyển tiếp trình duyệt")

## Ví dụ

Ví dụ này ghi lại thuộc tính `buttons` khi bạn kích hoạt sự kiện {{domxref("Element/mousedown_event", "mousedown")}}.

### HTML

```html
<p>Click anywhere with one or more mouse buttons.</p>
<pre id="log">[No clicks yet]</pre>
```

### JavaScript

```js
const buttonNames = ["left", "right", "wheel", "back", "forward"];
function mouseButtonPressed(event, buttonName) {
  // Use binary `&` with the relevant power of 2 to check if a given button is pressed
  return Boolean(event.buttons & (1 << buttonNames.indexOf(buttonName)));
}

function format(event) {
  const { type, buttons } = event;
  const obj = { type, buttons };
  for (const buttonName of buttonNames) {
    obj[buttonName] = mouseButtonPressed(event, buttonName);
  }
  return JSON.stringify(obj, null, 2);
}

const log = document.getElementById("log");
function logButtons(event) {
  log.textContent = format(event);
}

document.addEventListener("mouseup", logButtons);
document.addEventListener("mousedown", logButtons);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

### Ghi chú của Firefox

Firefox hỗ trợ thuộc tính `buttons` trên Windows, Linux (GTK) và macOS
với những hạn chế sau:

- Tiện ích cho phép tùy chỉnh thao tác nút bấm.
  Do đó, _primary_ có thể không phải là nút bên trái trên thiết bị, _secondary_ có thể không phải là nút bên phải, v.v.
  Hơn nữa, nút giữa (bánh xe), nút thứ 4 và nút thứ 5 có thể không được gán giá trị, ngay cả khi chúng được nhấn.
- Các thiết bị một nút bấm có thể mô phỏng các nút bổ sung bằng cách kết hợp các thao tác nhấn nút và bàn phím.
- Thiết bị cảm ứng có thể mô phỏng các nút bằng cử chỉ có thể định cấu hình (ví dụ: chạm bằng một ngón tay cho _chính_, chạm bằng hai ngón tay cho _phụ_, v.v.).
- Trên Linux (GTK), nút thứ 4 và nút thứ 5 không được hỗ trợ.
  Ngoài ra, sự kiện {{domxref("Element/mouseup_event", "mouseup")}} luôn bao gồm thông tin về nút nhả trong giá trị `buttons`.
- Trên Mac OS X 10.5, thuộc tính `buttons` luôn trả về `0` vì không có API nền tảng để triển khai tính năng này.

## Xem thêm

- {{domxref("MouseEvent")}}
