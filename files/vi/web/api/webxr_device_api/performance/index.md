---
title: WebXR performance guide
slug: Web/API/WebXR_Device_API/Performance
page-type: guide
---

{{DefaultAPISidebar("WebXR Device API")}}

Ứng dụng WebXR liên quan đến nhiều công nghệ khác nhau và có thể rất nhạy với các ràng buộc về hiệu năng. Vì vậy, bạn có thể cần điều chỉnh hoặc chấp nhận một số đánh đổi để tối ưu hiệu năng của ứng dụng WebXR sao cho có thể dùng được tốt nhất trên phạm vi thiết bị mục tiêu rộng nhất. Trong hướng dẫn này, chúng ta sẽ xem xét nhiều gợi ý và khuyến nghị giúp ứng dụng WebXR của bạn đạt hiệu năng tốt nhất có thể.

## Rendering tips

Nói về các vấn đề chung như giới hạn số vòng lặp khác nhau trong quá trình kết xuất, tránh vẽ không cần thiết, v.v.

Cũng có thể bao gồm nội dung từ [bài giải thích này trong kho đặc tả](https://github.com/immersive-web/webxr/blob/master/explainer.md#changing-the-field-of-view-for-inline-sessions).

## Managing rendering quality

Phần này sẽ lấy một phần nội dung từ [bài giải thích này trong kho đặc tả](https://github.com/immersive-web/webxr/blob/master/explainer.md#controlling-rendering-quality).

## Managing frame rate

Nội dung về việc quản lý tốc độ khung hình.

## Managing use of depth

Phần này sẽ kết hợp thông tin từ [bài giải thích này](https://github.com/immersive-web/webxr/blob/master/explainer.md#controlling-depth-precision) và [bài này](https://github.com/immersive-web/webxr/blob/master/explainer.md#preventing-the-compositor-from-using-the-depth-buffer) trong kho đặc tả.

## Optimizing memory use

Khi dùng các thư viện thực hiện những việc như tính toán ma trận, bạn thường có một số biến làm việc mà qua đó các vector, ma trận, và quaternion khác nhau đi qua theo thời gian. Vì vậy, hợp lý hơn là chỉ dùng một tập hợp hữu hạn các đối tượng này và thay thế nội dung của chúng bằng thông tin mới mỗi khi cần dùng. Có thể xem chúng tương tự như các thanh ghi trong bộ vi xử lý: một tập hợp giới hạn các ô lưu trữ bộ nhớ cho những kiểu dữ liệu hoặc trường hợp sử dụng cụ thể.

Mặc dù từng vector hay từng ma trận riêng lẻ không chiếm quá nhiều bộ nhớ, số lượng rất lớn của các vector, ma trận và cấu trúc khác được dùng để dựng mỗi khung hình của một cảnh 3D khiến việc quản lý bộ nhớ sớm muộn cũng trở thành vấn đề nếu bạn cứ liên tục cấp phát rồi giải phóng các đối tượng bộ nhớ.

Hãy xem xét đoạn sau:

```js
function drawScene(gl, view, programInfo, buffers, texture, deltaTime) {
  // …
  for (const object in scene) {
    const vertexList = [
      /* … */
    ];
    const normalMatrix = mat4.create();
    const modelViewMatrix = mat4.create();
    const objectMatrix = mat4.create();

    // Apply rotation updates to the object if needed

    mat4.rotate(/* … */);
  }
}
```

Đoạn này kết xuất một cảnh. Nhưng nó không hiệu quả, vì nó cấp phát ở dạng biến cục bộ một số thứ, gồm ít nhất hai ma trận, một mảng đỉnh, và nhiều thứ khác. Điều đó có nghĩa là với mỗi khung hình, runtime JavaScript phải cấp phát bộ nhớ cho chúng và khởi tạo chúng, có thể kích hoạt thu gom rác, rồi khi mỗi lần lặp của vòng hoàn tất, bộ nhớ mới được giải phóng.

Một thay đổi đơn giản có thể tối ưu điều này đáng kể:

```js
const vertexList = [
  /* … */
];
const normalMatrix = mat4.create();
const modelViewMatrix = mat4.create();

function drawScene(gl, view, programInfo, buffers, texture, deltaTime) {
  // …
  for (const object in scene) {
    // …
  }
}
```

Giờ đây, thay vì cấp phát biến ở mỗi lần lặp của vòng, chúng ta đang dùng các hằng toàn cục hoặc hằng của thành viên lớp. Cách này có nhiều lợi ích:

- Bộ nhớ đã cấp phát cho từng giá trị hoặc cấu trúc sẽ không cần được cấp phát lại ở mỗi khung hình. Điều này giảm khả năng kích hoạt thu gom rác và tối ưu việc sử dụng bộ nhớ.
- Bạn không thể vô tình xóa các đối tượng chứa vector và ma trận của mình, vì chúng là hằng.
- Tuy nhiên, bạn vẫn có thể thay thế _nội dung_ của từng đối tượng đó, nên chúng có thể tái sử dụng.

Bây giờ bạn đã tránh được một số lỗi lập trình có thể xảy ra, và toàn bộ hoạt ảnh của bạn cũng sẽ mượt hơn và có hiệu năng tốt hơn.
