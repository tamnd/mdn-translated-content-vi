---
title: "ShadowRoot: thuộc tính slotAssignment"
short-title: slotAssignment
slug: Web/API/ShadowRoot/slotAssignment
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.slotAssignment
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`slotAssignment`** của giao diện {{domxref("ShadowRoot")}} trả về _chế độ gán slot_ cho cây shadow DOM. Các nút được gán tự động (`named`) hoặc được gán thủ công (`manual`). Giá trị của thuộc tính này được xác định bằng tùy chọn `slotAssignment` khi gọi {{domxref("Element.attachShadow()")}}.

## Giá trị

Một chuỗi có thể là một trong các giá trị sau:

- `named`
  - : Các phần tử được gán tự động vào các phần tử {{HTMLElement("slot")}} bên trong shadow root này. Mọi nút hậu duệ của host có thuộc tính `slot` khớp với thuộc tính `name` của một `<slot>` trong shadow root này sẽ được gán vào slot đó. Mọi phần tử con cấp cao nhất của host không có thuộc tính `slot` sẽ được gán vào một `<slot>` không có thuộc tính `name` (slot mặc định) nếu có.
- `manual`
  - : Các phần tử không được gán tự động vào các phần tử {{HTMLElement("slot")}}. Thay vào đó, chúng phải được gán thủ công bằng {{domxref("HTMLSlotElement.assign()")}}.

## Ví dụ

Trong ví dụ dưới đây, phương thức `assign()` được dùng để hiển thị đúng tab trong một ứng dụng dùng tab. Hàm được gọi và truyền vào panel cần hiển thị, sau đó panel đó được gán vào slot. Chúng ta kiểm tra xem `slotAssignment` có phải là `named` hay không để ngăn một ngoại lệ được ném ra khi {{domxref("HTMLSlotElement.assign()")}} được gọi.

```js
function UpdateDisplayTab(elem, tabIdx) {
  const shadow = elem.shadowRoot;

  // Kiểm tra này thường không cần thiết, nhưng có thể hữu ích khi gỡ lỗi
  if (shadow.slotAssignment === "named") {
    console.error(
      "Trying to manually assign a slot on an automatically-assigned (named) slot",
    );
  }
  const slot = shadow.querySelector("slot");
  const panels = elem.querySelectorAll("tab-panel");
  if (panels.length && tabIdx && tabIdx <= panels.length) {
    slot.assign(panels[tabIdx - 1]);
  } else {
    slot.assign();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.attachShadow()")}}
- {{domxref("HTMLSlotElement.assign()")}}
