---
title: XRWebGLBinding
slug: Web/API/XRWebGLBinding
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRWebGLBinding
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRWebGLBinding`** được sử dụng để tạo các lớp có backend GPU.

## Hàm tạo

- {{domxref("XRWebGLBinding.XRWebGLBinding", "XRWebGLBinding()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `XRWebGLBinding` mới cho phiên XR và ngữ cảnh kết xuất WebGL được chỉ định.

## Thuộc tính phiên bản

- {{domxref("XRWebGLBinding.nativeProjectionScaleFactor")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : `scaleFactor` được truyền vào trong quá trình xây dựng lớp chiếu. Kích thước bộ đệm gốc được nhân với con số này.

## Phương thức phiên bản

- {{domxref("XRWebGLBinding.createCubeLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRCubeLayer")}}, là một lớp kết xuất trực tiếp từ [cubemap](https://en.wikipedia.org/wiki/Cube_mapping) và chiếu nó lên các mặt bên trong của một khối lập phương.
- {{domxref("XRWebGLBinding.createCylinderLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRCylinderLayer")}}, là một lớp chiếm một không gian hình chữ nhật cong trong môi trường thực tế ảo.
- {{domxref("XRWebGLBinding.createEquirectLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XREquirectLayer")}}, là một lớp ánh xạ dữ liệu được mã hóa [equirectangular](https://en.wikipedia.org/wiki/Equirectangular_projection) lên bên trong của một hình cầu.
- {{domxref("XRWebGLBinding.createProjectionLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRProjectionLayer")}}, là một lớp lấp đầy toàn bộ tầm nhìn của người quan sát và được làm mới gần với tốc độ khung gốc của thiết bị.
- {{domxref("XRWebGLBinding.createQuadLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRQuadLayer")}}, là một đối tượng hai chiều được định vị và định hướng trong không gian 3D.
- {{domxref("XRWebGLBinding.getDepthInformation()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRWebGLDepthInformation")}} chứa thông tin độ sâu WebGL.
- {{domxref("XRWebGLBinding.getReflectionCubeMap()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("WebGLTexture")}} chứa kết cấu bản đồ khối phản chiếu.
- {{domxref("XRWebGLBinding.getSubImage()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRWebGLSubImage")}} đại diện cho kết cấu WebGL cần kết xuất.
- {{domxref("XRWebGLBinding.getViewSubImage()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRWebGLSubImage")}} đại diện cho kết cấu WebGL cần kết xuất cho một {{domxref("XRView")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLLayer")}}
- {{domxref('WebGLRenderingContext')}} và {{domxref("WebGL2RenderingContext")}}
