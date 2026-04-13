---
title: "DOMQuad: fromQuad() static method"
short-title: fromQuad()
slug: Web/API/DOMQuad/fromQuad_static
page-type: web-api-static-method
browser-compat: api.DOMQuad.fromQuad_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromQuad()`** của giao diện {{domxref("DOMQuad")}} trả về một đối tượng `DOMQuad` mới dựa trên tập tọa độ được cung cấp có dạng của một đối tượng `DOMQuad` khác.

## Cú pháp

```js-nolint
DOMQuad.fromQuad()
DOMQuad.fromQuad(quad)
```

### Tham số

- `quad` {{optional_inline}}
  - : Một {{domxref("DOMQuad")}} hoặc một đối tượng có cùng thuộc tính. Tất cả các thuộc tính mặc định là `(0, 0, 0, 1)`. Các thuộc tính bao gồm:
    - {{domxref("DOMQuad/p1", "p1")}} {{optional_inline}}, {{domxref("DOMQuad/p2", "p2")}} {{optional_inline}}, {{domxref("DOMQuad/p3", "p3")}} {{optional_inline}}, {{domxref("DOMQuad/p4", "p4")}} {{optional_inline}}
      - : Mỗi thuộc tính là một {{domxref("DOMPoint")}} hoặc một đối tượng có cùng thuộc tính, đại diện cho một góc của tứ giác.

    Đối tượng này thường là một phiên bản {{domxref("DOMQuad")}} khác, hoặc một đối tượng hiện có được lấy từ một nguồn dữ liệu nào đó. Nếu bạn tạo đối tượng này từ đầu, nên sử dụng hàm khởi tạo {{domxref("DOMQuad.DOMQuad", "DOMQuad()")}}, nhận bốn điểm riêng biệt, tránh tạo đối tượng trung gian.

### Giá trị trả về

Một đối tượng {{domxref("DOMQuad")}}.

## Ví dụ

### Tạo quad từ DOMQuad hiện có

Ví dụ này cho thấy cách tạo một `DOMQuad` mới từ một `DOMQuad` đã có.

```js
const originalQuad = new DOMQuad(
  { x: 0, y: 0 },
  { x: 50, y: 0 },
  { x: 50, y: 50 },
  { x: 0, y: 50 },
);

const newQuad = DOMQuad.fromQuad(originalQuad);

console.log(newQuad.p1.x, newQuad.p1.y); // 0 0
console.log(newQuad.p2.x, newQuad.p2.y); // 50 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("DOMQuad.DOMQuad", "DOMQuad()")}}
- {{domxref("DOMPoint")}}
- {{domxref("DOMRect")}}
