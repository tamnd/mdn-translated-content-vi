---
title: SVGTransform
slug: Web/API/SVGTransform
page-type: web-api-interface
browser-compat: api.SVGTransform
---

{{APIRef("SVG")}}

Giao diện **`SVGTransform`** phản ánh một trong các phép biến đổi thành phần trong {{ domxref("SVGTransformList") }}; do đó, một đối tượng `SVGTransform` tương ứng với một thành phần duy nhất (ví dụ: `scale(…)` hoặc `matrix(…)`) trong thuộc tính {{ SVGAttr("transform") }}.

Một đối tượng `SVGTransform` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

## Thuộc tính phiên bản

- {{domxref("SVGTransform.type", "type")}}
  - : Kiểu của giá trị được chỉ định bởi một trong các hằng số `SVG_TRANSFORM_*` được định nghĩa trên giao diện này.
- {{domxref("SVGTransform.angle", "angle")}}
  - : Góc dưới dạng giá trị dấu phẩy động. Thuộc tính tiện lợi cho `SVG_TRANSFORM_ROTATE`, `SVG_TRANSFORM_SKEWX` và `SVG_TRANSFORM_SKEWY`. Đối với `SVG_TRANSFORM_MATRIX`, `SVG_TRANSFORM_TRANSLATE` và `SVG_TRANSFORM_SCALE`, `angle` sẽ bằng không.
- {{domxref("SVGTransform.matrix", "matrix")}}
  - : Ma trận dưới dạng {{ domxref("DOMMatrix") }} đại diện cho phép biến đổi này. Đối tượng ma trận là live, nghĩa là mọi thay đổi đối với đối tượng `SVGTransform` được phản ánh ngay lập tức trong đối tượng ma trận và ngược lại. Trong trường hợp đối tượng ma trận được thay đổi trực tiếp (tức là, không sử dụng các phương thức trên giao diện `SVGTransform`) thì kiểu của `SVGTransform` thay đổi thành `SVG_TRANSFORM_MATRIX`.

## Phương thức phiên bản

- {{domxref("SVGTransform.setMatrix", "setMatrix()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_MATRIX`, với tham số matrix xác định phép biến đổi mới. Lưu ý rằng các giá trị từ tham số `matrix` được sao chép.
- {{domxref("SVGTransform.setTranslate", "setTranslate()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_TRANSLATE`, với các tham số `tx` và `ty` xác định lượng dịch chuyển.
- {{domxref("SVGTransform.setScale", "setScale()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_SCALE`, với các tham số `sx` và `sy` xác định lượng co giãn.
- {{domxref("SVGTransform.setRotate", "setRotate()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_ROTATE`, với tham số `angle` xác định góc quay và các tham số `cx` và `cy` xác định tâm quay tùy chọn.
- {{domxref("SVGTransform.setSkewX", "setSkewX()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_SKEWX`, với tham số `angle` xác định mức độ nghiêng.
- {{domxref("SVGTransform.setSkewY", "setSkewY()")}}
  - : Đặt kiểu biến đổi thành `SVG_TRANSFORM_SKEWY`, với tham số `angle` xác định mức độ nghiêng.

## Thuộc tính tĩnh

- `SVG_TRANSFORM_UNKNOWN` (0)
  - : Kiểu đơn vị không phải là một trong các kiểu đơn vị được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa giá trị mới kiểu này hoặc chuyển đổi giá trị hiện có sang kiểu này.
- `SVG_TRANSFORM_MATRIX` (1)
  - : Phép biến đổi `matrix(…)`.
- `SVG_TRANSFORM_TRANSLATE` (2)
  - : Phép biến đổi `translate(…)`.
- `SVG_TRANSFORM_SCALE` (3)
  - : Phép biến đổi `scale(…)`.
- `SVG_TRANSFORM_ROTATE` (4)
  - : Phép biến đổi `rotate(…)`.
- `SVG_TRANSFORM_SKEWX` (5)
  - : Phép biến đổi `skewx(…)`.
- `SVG_TRANSFORM_SKEWY` (6)
  - : Phép biến đổi `skewy(…)`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
