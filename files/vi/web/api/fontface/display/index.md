---
title: "FontFace: thuộc tính display"
short-title: display
slug: Web/API/FontFace/display
page-type: web-api-instance-property
browser-compat: api.FontFace.display
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính **`display`** của giao diện {{domxref("FontFace")}} xác định cách hiển thị font face dựa trên việc nó đã được tải về và sẵn sàng dùng chưa. Thuộc tính này tương đương với descriptor CSS `font-display`.

Khi thuộc tính này được dùng, việc tải font có ba giai đoạn. Độ dài của hai giai đoạn đầu phụ thuộc vào giá trị thuộc tính và trình duyệt.

- Giai đoạn block
  - : Trình duyệt vô hình chuẩn bị font dự phòng. Nếu font face tải xong trong thời gian này, nó được dùng để hiển thị văn bản.
- Giai đoạn swap
  - : Nếu font face vẫn chưa tải xong, font dự phòng sẽ hiển thị. Khi font face tải xong, font dự phòng sẽ được thay thế bằng font đã tải.
- Giai đoạn failure
  - : Nếu font face vẫn không tải được, font dự phòng sẽ hiển thị và không có swap nào xảy ra.

## Giá trị

Một chuỗi với một trong các giá trị sau.

- `auto`
  - : Dùng chiến lược hiển thị font do trình duyệt cung cấp.
- `block`
  - : Cho font face một giai đoạn block ngắn và giai đoạn swap vô hạn. Spec khuyến nghị 3 giây cho giai đoạn block, nhưng có thể thay đổi tùy trình duyệt.
- `fallback`
  - : Cho font face một giai đoạn block ngắn và một giai đoạn swap ngắn. Spec khuyến nghị 100 ms hoặc ít hơn cho giai đoạn block và 3 giây cho giai đoạn swap, nhưng các giá trị này có thể thay đổi tùy trình duyệt.
- `optional`
  - : Cho font face một giai đoạn block ngắn và không có giai đoạn swap. Spec khuyến nghị 100 ms hoặc ít hơn, nhưng có thể thay đổi tùy trình duyệt.
- `swap`
  - : Cho font face giai đoạn block 0 giây và giai đoạn swap vô hạn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
