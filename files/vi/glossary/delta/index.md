---
title: Delta
slug: Glossary/Delta
page-type: glossary-definition
sidebar: glossarysidebar
---

Thuật ngữ **delta** đề cập đến sự khác biệt giữa hai giá trị hoặc trạng thái.

Tên gọi bắt nguồn từ chữ cái Hy Lạp Δ (delta), tương đương với chữ cái _D_ trong bảng chữ cái La Mã. _Delta_ đề cập đến việc sử dụng chữ cái Δ làm ký hiệu tắt cho _difference_ (sự khác biệt).

Thuật ngữ _delta_ thường được sử dụng khi truyền đạt các thay đổi về tốc độ, vị trí hoặc gia tốc của một đối tượng vật lý hoặc ảo. Nó cũng được sử dụng khi mô tả các thay đổi về âm lượng hoặc tần số của sóng âm thanh.

Ví dụ, khi mô tả khoảng cách di chuyển của một đối tượng trên màn hình từ trái sang phải, người ta có thể sử dụng thuật ngữ _delta x_ hoặc _Δx_.

Tương tự, khi biết giá trị mới của _X_ và giá trị cũ của nó, bạn có thể tính toán delta như sau:

```js
let deltaX = newX - oldX;
```

Thông thường hơn, bạn nhận được delta và sử dụng nó để cập nhật điều kiện trước đó đã lưu:

```js
let newX = oldX + deltaX;
```

Ví dụ, các sự kiện con lăn chuột {{domxref("WheelEvent")}} cung cấp lượng con lăn đã di chuyển kể từ sự kiện cuối cùng trong các thuộc tính {{domxref("WheelEvent.deltaX", "deltaX")}}, {{domxref("WheelEvent.deltaY", "deltaY")}}, và {{domxref("WheelEvent.deltaZ", "deltaZ")}}.
