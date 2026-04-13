---
title: SVGPreserveAspectRatio
slug: Web/API/SVGPreserveAspectRatio
page-type: web-api-interface
browser-compat: api.SVGPreserveAspectRatio
---

{{APIRef("SVG")}}

Giao diện **`SVGPreserveAspectRatio`** tương ứng với thuộc tính {{SVGAttr("preserveAspectRatio")}}.

Một đối tượng `SVGPreserveAspectRatio` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực để sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

## Thuộc tính phiên bản

- {{domxref("SVGPreserveAspectRatio.align", "align")}}
  - : Kiểu của giá trị căn chỉnh được chỉ định bởi một trong các hằng số `SVG_PRESERVEASPECTRATIO_*` được định nghĩa trên giao diện này.
- {{domxref("SVGPreserveAspectRatio.meetOrSlice", "meetOrSlice")}}
  - : Kiểu của giá trị meet-or-slice được chỉ định bởi một trong các hằng số `SVG_MEETORSLICE_*` được định nghĩa trên giao diện này.

## Phương thức phiên bản

_Giao diện `SVGPreserveAspectRatio` không cung cấp bất kỳ phương thức cụ thể nào._

## Thuộc tính tĩnh

- `SVG_PRESERVEASPECTRATIO_UNKNOWN` (0)
  - : Kiểu liệt kê được đặt thành giá trị không phải là một trong các kiểu được xác định trước. Không hợp lệ khi cố gắng định nghĩa một giá trị mới của kiểu này hoặc khi cố gắng chuyển đổi giá trị hiện có sang kiểu này.
- `SVG_PRESERVEASPECTRATIO_NONE` (1)
  - : Tương ứng với giá trị `none` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMINYMIN` (2)
  - : Tương ứng với giá trị `xMinYMin` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMIDYMIN` (3)
  - : Tương ứng với giá trị `xMidYMin` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMAXYMIN` (4)
  - : Tương ứng với giá trị `xMaxYMin` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMINYMID` (5)
  - : Tương ứng với giá trị `xMinYMid` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMIDYMID` (6)
  - : Tương ứng với giá trị `xMidYMid` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMAXYMID` (7)
  - : Tương ứng với giá trị `xMaxYMid` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMINYMAX` (8)
  - : Tương ứng với giá trị `xMinYMax` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMIDYMAX` (9)
  - : Tương ứng với giá trị `xMidYMax` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_PRESERVEASPECTRATIO_XMAXYMAX` (10)
  - : Tương ứng với giá trị `xMaxYMax` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_MEETORSLICE_UNKNOWN` (0)
  - : Kiểu liệt kê được đặt thành giá trị không phải là một trong các kiểu được xác định trước. Không hợp lệ khi cố gắng định nghĩa một giá trị mới của kiểu này hoặc khi cố gắng chuyển đổi giá trị hiện có sang kiểu này.
- `SVG_MEETORSLICE_MEET` (1)
  - : Tương ứng với giá trị `meet` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.
- `SVG_MEETORSLICE_SLICE` (2)
  - : Tương ứng với giá trị `slice` cho thuộc tính {{SVGAttr("preserveAspectRatio")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
