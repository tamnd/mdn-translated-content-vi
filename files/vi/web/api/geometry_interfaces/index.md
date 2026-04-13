---
title: Geometry interfaces
slug: Web/API/Geometry_interfaces
page-type: web-api-overview
browser-compat:
  - api.DOMMatrix
  - api.DOMMatrixReadOnly
  - api.DOMPoint
  - api.DOMPointReadOnly
  - api.DOMQuad
  - api.DOMRect
  - api.DOMRectReadOnly
---

{{DefaultAPISidebar("Geometry Interfaces")}}

**Geometry interfaces** là một module CSS cung cấp các giao diện để làm việc với đồ họa 3D và 2D — đặc biệt là để làm việc với các điểm, hình chữ nhật, tứ giác và [ma trận biến đổi](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web#transformation_matrices) (cho các phép tịnh tiến/di chuyển, co giãn, xoay, xiên/cắt và lật đồ họa, cũng như để nhân/kết hợp và đảo ngược/hoàn tác các phép đó).

Là nhà phát triển web, bạn không phải lúc nào cũng sử dụng trực tiếp các geometry interface, mà thay vào đó sử dụng các tính năng khác dựa vào chúng ở phía sau: các phần của [CSS Transforms](/en-US/docs/Web/CSS/Guides/Transforms), [Canvas API](/en-US/docs/Web/API/Canvas_API), [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) và (trực tiếp hơn) {{domxref('VideoFrame.visibleRect')}}, {{domxref('Element.getClientRects()')}} và {{domxref('Element.getBoundingClientRect()')}}.

## Giao diện

- {{domxref('DOMMatrix')}}
  - : Đại diện cho [ma trận biến đổi](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web#transformation_matrices), cho các phép tịnh tiến/di chuyển, co giãn, xoay, xiên/cắt và lật đồ họa, cũng như để nhân/kết hợp và đảo ngược/hoàn tác các phép đó.
- {{domxref('DOMMatrixReadOnly')}}
  - : Phiên bản chỉ đọc của {{domxref('DOMMatrix')}}.
- {{domxref('DOMPoint')}}
  - : Đại diện cho điểm 2D hoặc 3D trong hệ tọa độ; bao gồm các giá trị cho tọa độ trong tối đa ba chiều, cũng như giá trị phối cảnh tùy chọn.
- {{domxref('DOMPointReadOnly')}}
  - : Phiên bản chỉ đọc của {{domxref('DOMPoint')}}.
- {{domxref('DOMQuad')}}
  - : Đại diện cho tập hợp bốn đối tượng {{domxref('DOMPoint')}} xác định các góc của [tứ giác](https://en.wikipedia.org/wiki/Quadrilateral).
- {{domxref('DOMRect')}}
  - : Đại diện cho kích thước và vị trí của hình chữ nhật.
- {{domxref('DOMRectReadOnly')}}
  - : Phiên bản chỉ đọc của {{domxref('DOMRect')}}.

## Ví dụ

Các bài viết {{domxref('Path2D.addPath()')}} và {{domxref('CanvasPattern.setTransform()')}} có các ví dụ sử dụng một số geometry interface.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('Path2D.addPath()')}}
- {{domxref('CanvasPattern.setTransform()')}}
- {{domxref('CanvasRenderingContext2D.getTransform()')}}
- {{domxref('CanvasRenderingContext2D.setTransform()')}}
- {{domxref('CSSTransformValue.toMatrix()')}}
- {{domxref('CSSTransformComponent.toMatrix()')}}
- {{domxref('Element.getBoundingClientRect()')}}
- {{domxref('Element.getClientRects()')}}
- {{domxref('VideoFrame.visibleRect')}}
- {{domxref('XRLightEstimate')}}
- {{domxref('XRRigidTransform')}}
