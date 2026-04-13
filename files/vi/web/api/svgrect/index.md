---
title: SVGRect
slug: Web/API/SVGRect
page-type: web-api-interface
browser-compat: api.SVGRect
---

{{APIRef("SVG")}}

**`SVGRect`**, một bí danh của {{DOMXref("DOMRect")}}, đại diện cho một hình chữ nhật. Hình chữ nhật bao gồm một cặp tọa độ `x` và `y` xác định giá trị `x` tối thiểu, giá trị `y` tối thiểu, và `width` (chiều rộng) và `height` (chiều cao), phải là các giá trị không âm.

Một đối tượng `SVGRect` có thể được chỉ định là chỉ đọc, nghĩa là các lần cố gắng sửa đổi đối tượng sẽ dẫn đến một ngoại lệ được ném ra.

## Thuộc tính phiên bản

- {{domxref("SVGRect.x")}}
  - : Hiệu ứng chính xác của tọa độ này phụ thuộc vào từng phần tử. Nếu thuộc tính không được chỉ định, hiệu ứng như thể giá trị `0` được chỉ định.
- {{domxref("SVGRect.y")}}
  - : Hiệu ứng chính xác của tọa độ này phụ thuộc vào từng phần tử. Nếu thuộc tính không được chỉ định, hiệu ứng như thể giá trị `0` được chỉ định.
- {{domxref("SVGRect.width")}}
  - : Đây đại diện cho chiều rộng của hình chữ nhật. Giá trị âm dẫn đến lỗi. Giá trị `0` vô hiệu hóa việc hiển thị phần tử.
- {{domxref("SVGRect.height")}}
  - : Đây đại diện cho chiều cao của hình chữ nhật. Giá trị âm dẫn đến lỗi. Giá trị `0` vô hiệu hóa việc hiển thị phần tử.

## Phương thức phiên bản

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("DOMRect")}}
- {{DOMXref("DOMPoint")}} bí danh {{DOMXref("SVGPoint")}}
- {{DOMXref("DOMMatrix")}} bí danh {{DOMXref("SVGMatrix")}}
