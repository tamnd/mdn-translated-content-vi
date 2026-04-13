---
title: SVGNumber
slug: Web/API/SVGNumber
page-type: web-api-interface
browser-compat: api.SVGNumber
---

{{APIRef("SVG")}}

Giao diện **`SVGNumber`** tương ứng với kiểu dữ liệu cơ bản {{cssxref("&lt;number&gt;")}}.

Một đối tượng `SVGNumber` có thể được chỉ định là chỉ đọc, có nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến một ngoại lệ được ném ra.

## Thuộc tính phiên bản

- {{domxref("SVGNumber.value")}}
  - : Một số thực đại diện cho số.

    Lưu ý: Nếu `SVGNumber` là chỉ đọc, một {{domxref("DOMException")}} với mã NO_MODIFICATION_ALLOWED_ERR sẽ được phát sinh khi cố gắng thay đổi giá trị.

## Phương thức phiên bản

_Giao diện này không cung cấp bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
