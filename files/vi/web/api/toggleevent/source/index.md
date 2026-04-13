---
title: "ToggleEvent: source property"
short-title: source
slug: Web/API/ToggleEvent/source
page-type: web-api-instance-property
browser-compat: api.ToggleEvent.source
---

{{APIRef("Popover API")}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("ToggleEvent")}} là một phiên bản đối tượng {{domxref("Element")}} biểu diễn phần tử điều khiển popover HTML đã khởi tạo việc chuyển đổi.

## Giá trị

Một phiên bản đối tượng {{domxref("Element")}}, hoặc `null` nếu popover không được kích hoạt bởi một phần tử điều khiển.

## Mô tả

Một phần tử {{htmlelement("button")}} có thể được đặt làm điều khiển popover bằng cách chỉ định [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử popover trong thuộc tính [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor) hoặc [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget) của nó.

Khi sự kiện [`toggle`](/en-US/docs/Web/API/HTMLElement/toggle_event) kích hoạt trên popover, thuộc tính `source` của đối tượng sự kiện `ToggleEvent` sẽ chứa tham chiếu đến nút điều khiển popover đã khởi tạo việc chuyển đổi. Điều này hữu ích để chạy mã khác nhau để phản hồi sự kiện `toggle` tùy thuộc vào điều khiển popover nào đã khởi tạo nó.

Nếu phần tử popover không được kích hoạt bởi một nút điều khiển, ví dụ nếu nó được điều khiển bằng phương thức JavaScript như {{domxref("HTMLElement.togglePopover()")}}, thuộc tính `source` là `null`.

## Ví dụ

### Sử dụng cơ bản của `source`

Bản demo này cho thấy cách sử dụng thuộc tính `source` để thực hiện các hành động khác nhau dựa trên nút điều khiển đóng phần tử popover.

#### HTML

```html live-sample___toggleevent-source
<button commandfor="popover" command="show-popover">
  Select cookie preference
</button>
<p id="output"></p>
<div id="popover" popover="auto">
  <h3>Would you like a cookie?</h3>
  <button id="yes" commandfor="popover" command="hide-popover">Yes</button>
  <button id="no" commandfor="popover" command="hide-popover">No</button>
</div>
```

```css hidden live-sample___toggleevent-source
html {
  font-family: sans-serif;
}

[popover] {
  border: 1px solid grey;
  padding: 10px 20px;
  border-radius: 5px;
}

[popover] h3 {
  margin: 0 0 10px;
}
```

#### JavaScript

```js live-sample___toggleevent-source
const yesBtn = document.getElementById("yes");
const noBtn = document.getElementById("no");
const popover = document.getElementById("popover");
const output = document.getElementById("output");
```

```js live-sample___toggleevent-source
if (yesBtn.command === undefined) {
  output.textContent = "Popover control command attribute not supported.";
} else {
  popover.addEventListener("toggle", (event) => {
    if (event.source === undefined) {
      output.textContent = "ToggleEvent.source not supported.";
    } else if (event.source === yesBtn) {
      output.textContent = "Cookie set!";
    } else if (event.source === noBtn) {
      output.textContent = "No cookie set.";
    }
  });
}
```

#### Kết quả

{{embedlivesample("toggleevent-source", "100%", "100")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
