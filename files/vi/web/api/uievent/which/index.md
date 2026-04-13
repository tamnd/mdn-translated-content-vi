---
title: "UIEvent: which property"
short-title: which
slug: Web/API/UIEvent/which
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.UIEvent.which
---

{{APIRef("UI Events")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc **`UIEvent.which`** của giao diện {{domxref("UIEvent")}} trả về số cho biết nút nào trên chuột được nhấn, hoặc `keyCode` số hoặc mã ký tự (`charCode`) của phím được nhấn trên bàn phím.

## Giá trị

### Giá trị cho KeyboardEvent {{Non-standard_Inline}}

Đối với {{domxref("KeyboardEvent")}}, `event.which` chứa mã số cho một phím cụ thể được nhấn, tùy thuộc vào phím chữ hoặc số hay phím không phải chữ số được nhấn.
Vui lòng xem {{domxref("KeyboardEvent.charCode")}} và {{domxref("KeyboardEvent.keyCode")}} đã lỗi thời để biết thêm chi tiết.

> [!NOTE]
> Hãy xem xét {{domxref("KeyboardEvent.key")}} hoặc {{domxref("KeyboardEvent.code")}} cho code mới.

### Giá trị cho MouseEvent {{Non-standard_Inline}}

Đối với {{domxref("MouseEvent")}}, `event.which` là số đại diện cho một nút nhất định:

- `0`: Không có nút
- `1`: Nút trái
- `2`: Nút giữa (nếu có)
- `3`: Nút phải

Đối với chuột được cấu hình cho người thuận tay trái, các hành động nút bị đảo ngược. Trong trường hợp này, các giá trị được đọc từ phải sang trái.

> [!NOTE]
> Hãy xem xét {{domxref("MouseEvent.button")}} cho code mới.

## Ví dụ

```html
<p>Please press any key.</p>
```

```js
function showKeyPress(evt) {
  console.log(
    `onkeypress handler:\n` +
      `keyCode property: ${evt.keyCode}\n` +
      `which property: ${evt.which}\n` +
      `charCode property: ${evt.charCode}\n` +
      `Character Key Pressed: ${String.fromCharCode(evt.charCode)}\n`,
  );
}

function keyDown(evt) {
  console.log(
    `onkeydown handler:\n` +
      `keyCode property: ${evt.keyCode}\n` +
      `which property: ${evt.which}\n`,
  );
}

document.addEventListener("keypress", showKeyPress);
document.addEventListener("keydown", keyDown);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyboardEvent")}}
- {{domxref("MouseEvent")}}
