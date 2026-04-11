---
title: PannerNode
slug: Web/API/PannerNode
page-type: web-api-interface
browser-compat: api.PannerNode
---

{{ APIRef("Web Audio API") }}

Giao diện `PannerNode` định nghĩa một đối tượng xử lý âm thanh biểu diễn vị trí, hướng và hành vi của tín hiệu nguồn âm thanh trong không gian vật lý mô phỏng. {{domxref("AudioNode")}} này sử dụng hệ tọa độ Descartes tay phải để mô tả _vị trí_ của nguồn dưới dạng vectơ và _hướng_ của nó dưới dạng hình nón 3D.

Một `PannerNode` luôn có đúng một đầu vào và một đầu ra: đầu vào có thể là _mono_ hoặc _stereo_ nhưng đầu ra luôn là _stereo_ (2 kênh); bạn không thể tạo hiệu ứng phân bố âm thanh mà không có ít nhất hai kênh âm thanh!

![PannerNode xác định vị trí không gian và hướng cho tín hiệu nhất định.](webaudiopannernode.png)

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>"clamped-max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("PannerNode.PannerNode", "PannerNode()")}}
  - : Tạo một phiên bản đối tượng `PannerNode` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("AudioNode")}}_.

> [!NOTE]
> Giá trị hướng và vị trí được đặt và truy xuất bằng cú pháp khác nhau, vì chúng được lưu trữ dưới dạng giá trị {{domxref("AudioParam")}}. Truy xuất được thực hiện bằng cách truy cập, ví dụ `PannerNode.positionX`. Trong khi đó, để đặt cùng thuộc tính, ta dùng `PannerNode.positionX.value`. Đây là lý do các giá trị này không được đánh dấu là chỉ đọc, dù chúng xuất hiện như vậy trong WebIDL.

- {{domxref("PannerNode.coneInnerAngle")}}
  - : Giá trị double mô tả góc, tính bằng độ, của hình nón bên trong mà ở đó không có sự giảm âm lượng.
- {{domxref("PannerNode.coneOuterAngle")}}
  - : Giá trị double mô tả góc, tính bằng độ, của hình nón bên ngoài mà ở đó âm lượng sẽ giảm đi một lượng không đổi, được xác định bởi thuộc tính `coneOuterGain`.
- {{domxref("PannerNode.coneOuterGain")}}
  - : Giá trị double mô tả mức giảm âm lượng bên ngoài hình nón được xác định bởi thuộc tính `coneOuterAngle`. Giá trị mặc định là `0`, nghĩa là không có âm thanh nào được nghe thấy.
- {{domxref("PannerNode.distanceModel")}}
  - : Giá trị liệt kê xác định thuật toán nào được dùng để giảm âm lượng của nguồn âm thanh khi nó di chuyển xa người nghe. Các giá trị có thể là `"linear"`, `"inverse"` và `"exponential"`. Giá trị mặc định là `"inverse"`.
- {{domxref("PannerNode.maxDistance")}}
  - : Giá trị double biểu diễn khoảng cách tối đa giữa nguồn âm thanh và người nghe, sau khoảng cách đó âm lượng không giảm thêm nữa.
- {{domxref("PannerNode.orientationX")}}
  - : Biểu diễn vị trí ngang của vectơ nguồn âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 1.
- {{domxref("PannerNode.orientationY")}}
  - : Biểu diễn vị trí dọc của vectơ nguồn âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 0.
- {{domxref("PannerNode.orientationZ")}}
  - : Biểu diễn vị trí theo chiều dọc (tiến lùi) của vectơ nguồn âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 0.
- {{domxref("PannerNode.panningModel")}}
  - : Giá trị liệt kê xác định thuật toán không gian hóa nào được dùng để định vị âm thanh trong không gian 3D.
- {{domxref("PannerNode.positionX")}}
  - : Biểu diễn vị trí ngang của âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 0.
- {{domxref("PannerNode.positionY")}}
  - : Biểu diễn vị trí dọc của âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 0.
- {{domxref("PannerNode.positionZ")}}
  - : Biểu diễn vị trí theo chiều sâu (tiến lùi) của âm thanh trong hệ tọa độ Descartes tay phải. Mặc dù không thể thay đổi trực tiếp {{domxref("AudioParam")}} này, giá trị của nó có thể được thay đổi thông qua thuộc tính {{domxref("AudioParam.value", "value")}}. Giá trị mặc định là 0.
- {{domxref("PannerNode.refDistance")}}
  - : Giá trị double biểu diễn khoảng cách tham chiếu để giảm âm lượng khi nguồn âm thanh di chuyển xa người nghe hơn. Với khoảng cách lớn hơn giá trị này, âm lượng sẽ giảm dựa trên `rolloffFactor` và `distanceModel`.
- {{domxref("PannerNode.rolloffFactor")}}
  - : Giá trị double mô tả tốc độ giảm âm lượng khi nguồn di chuyển xa người nghe. Giá trị này được dùng bởi tất cả các mô hình khoảng cách.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("AudioNode")}}_.

- {{domxref("PannerNode.setPosition()")}} {{deprecated_inline}}
  - : Xác định vị trí của nguồn âm thanh tương đối với người nghe (được biểu diễn bởi đối tượng {{domxref("AudioListener")}} được lưu trong thuộc tính {{domxref("BaseAudioContext.listener")}}).
- {{domxref("PannerNode.setOrientation()")}} {{deprecated_inline}}
  - : Xác định hướng phát của nguồn âm thanh.

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
