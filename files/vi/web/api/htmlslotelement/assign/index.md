---
title: "HTMLSlotElement: phương thức assign()"
short-title: assign()
slug: Web/API/HTMLSlotElement/assign
page-type: web-api-instance-method
browser-compat: api.HTMLSlotElement.assign
---

{{APIRef("Shadow DOM API")}}

Phương thức **`assign()`** của giao diện {{domxref("HTMLSlotElement")}} đặt các _nút được gán thủ công_ của slot thành một tập hợp có thứ tự các slottable. Tập các nút được gán thủ công ban đầu là rỗng cho đến khi các nút được gán bằng `assign()`.

> [!NOTE]
> Bạn không thể trộn các kiểu gán slot thủ công (mệnh lệnh) và gán theo tên (khai báo, tự động). Vì vậy, để phương thức này hoạt động, shadow tree cần đã được [tạo](/en-US/docs/Web/API/Element/attachShadow) với tùy chọn `slotAssignment: "manual"`.

## Cú pháp

```js-nolint
assign(node1)
assign(node1, node2)
assign(node1, node2, /* …, */ nodeN)
```

### Tham số

- `node1`, …, `nodeN`
  - : Một tập hợp các nút {{domxref("Element")}} hoặc {{domxref("Text")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi gọi phương thức này trên một slot được gán tự động.

## Ví dụ

Trong ví dụ dưới đây, phương thức `assign()` được dùng để hiển thị đúng tab trong một ứng dụng có tab. Hàm được gọi và nhận panel cần hiển thị, rồi panel đó được gán vào slot.

```js
function UpdateDisplayTab(elem, tabIdx) {
  const shadow = elem.shadowRoot;
  const slot = shadow.querySelector("slot");
  const panels = elem.querySelectorAll("tab-panel");
  if (panels.length && tabIdx && tabIdx <= panels.length) {
    slot.assign(panels[tabIdx - 1]);
  } else {
    slot.assign();
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.attachShadow()")}}
