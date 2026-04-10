---
title: "Event: thuộc tính target"
short-title: target
slug: Web/API/Event/target
page-type: web-api-instance-property
browser-compat: api.Event.target
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`target`** của giao diện {{domxref("Event")}} là một tham chiếu tới đối tượng mà sự kiện được gửi tới. Nó khác với {{domxref("Event.currentTarget")}} khi bộ xử lý sự kiện được gọi trong pha bubbling hoặc capturing của sự kiện.

## Giá trị

Một {{domxref("EventTarget")}} tương ứng.

## Ví dụ

Thuộc tính `event.target` có thể được dùng để triển khai **ủy nhiệm sự kiện**.

```js
// Tạo một danh sách
const ul = document.createElement("ul");
document.body.appendChild(ul);

const li1 = document.createElement("li");
const li2 = document.createElement("li");
ul.appendChild(li1);
ul.appendChild(li2);

function hide(evt) {
  // evt.target tham chiếu tới phần tử <li> đã được nhấp
  // Điều này khác với evt.currentTarget, vốn sẽ tham chiếu tới <ul> cha trong ngữ cảnh này
  evt.target.style.visibility = "hidden";
}

// Gắn bộ lắng nghe vào danh sách
// Nó sẽ được gọi khi mỗi <li> được nhấp
ul.addEventListener("click", hide);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Sự lan truyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling)
