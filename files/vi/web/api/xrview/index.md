---
title: XRView
slug: Web/API/XRView
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRView
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRView`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) mô tả một chế độ xem vào cảnh XR cho một khung hình cụ thể, cung cấp thông tin về hướng và vị trí của góc nhìn. Bạn có thể coi nó như một mô tả về một mắt hoặc máy ảnh cụ thể và cách nó nhìn thế giới. Một khung hình 3D sẽ bao gồm hai chế độ xem, một cho mỗi mắt, được tách bởi một khoảng cách phù hợp tương đương với khoảng cách giữa hai mắt của người xem. Điều này cho phép hai chế độ xem, khi được chiếu riêng lẻ vào các mắt tương ứng, mô phỏng một thế giới 3D.

## Thuộc tính phiên bản

- {{domxref("XRView.eye", "eye")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Mắt nào (`left` hay `right`) mà `XRView` này đại diện cho góc nhìn. Giá trị này được dùng để đảm bảo rằng nội dung được dựng sẵn cho một mắt cụ thể được phân phối hoặc định vị đúng. Giá trị cũng có thể là `none` nếu `XRView` đang trình bày dữ liệu đơn thị (chẳng hạn như hình ảnh 2D, chế độ xem toàn màn hình văn bản, hoặc cận cảnh thứ không cần xuất hiện ở dạng 3D).
- {{domxref("XRView.isFirstPersonObserver", "isFirstPersonObserver")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị boolean cho biết `XRView` có phải là chế độ xem quan sát góc nhìn thứ nhất hay không.
- {{domxref("XRView.projectionMatrix", "projectionMatrix")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Ma trận chiếu sẽ biến đổi cảnh để xuất hiện đúng theo góc nhìn được chỉ định bởi `eye`. Ma trận này nên được sử dụng trực tiếp để tránh méo hình hiển thị có thể gây khó chịu nghiêm trọng cho người dùng.
- {{domxref("XRView.recommendedViewportScale", "recommendedViewportScale")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Giá trị tỷ lệ viewport được khuyến nghị mà bạn có thể dùng cho `requestViewportScale()` nếu tác nhân người dùng có đề xuất; [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không.
- {{domxref("XRView.transform", "transform")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("XRRigidTransform")}} mô tả vị trí và hướng hiện tại của góc nhìn liên quan đến {{domxref("XRReferenceSpace")}} được chỉ định khi {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} được gọi trên {{domxref("XRFrame")}} đang được dựng hình.

## Phương thức phiên bản

- {{domxref("XRView.requestViewportScale", "requestViewportScale()")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Yêu cầu tác nhân người dùng đặt tỷ lệ viewport được yêu cầu cho viewport này theo giá trị đã cho.

## Ghi chú sử dụng

### Vị trí và số lượng XRView trên mỗi khung hình

Khi dựng hình một cảnh, tập hợp các chế độ xem được dùng để dựng cảnh cho người xem tại khung hình hiện tại được lấy bằng cách gọi phương thức {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} của đối tượng {{domxref("XRFrame")}} để nhận {{domxref("XRViewerPose")}} đại diện (về cơ bản) vị trí đầu người xem. Thuộc tính {{domxref("XRViewerPose.views", "views")}} của đối tượng đó là danh sách tất cả các đối tượng `XRView` đại diện cho các góc nhìn có thể được dùng để xây dựng cảnh trình bày cho người dùng.

Có thể có các đối tượng `XRView` đại diện cho các vùng chồng lên nhau cũng như các vùng hoàn toàn khác biệt; trong trò chơi, bạn có thể có các chế độ xem để quan sát một địa điểm từ xa qua camera an ninh hoặc thiết bị khác chẳng hạn. Nói cách khác, đừng giả định rằng luôn có đúng hai chế độ xem cho một người xem nhất định; có thể chỉ có một (ví dụ khi dựng cảnh ở chế độ `inline`), và có thể có nhiều hơn (đặc biệt nếu trường nhìn rất rộng). Cũng có thể có các chế độ xem đại diện cho người quan sát đang xem hành động, hoặc các góc nhìn khác không liên quan trực tiếp đến mắt người chơi.

Ngoài ra, số lượng chế độ xem có thể thay đổi bất cứ lúc nào, tùy thuộc vào nhu cầu của từng thời điểm. Vì vậy bạn nên xử lý danh sách chế độ xem mỗi lần mà không đưa ra các giả định dựa trên các khung hình trước.

Tất cả vị trí và hướng trong các chế độ xem cho một {{domxref("XRViewerPose")}} nhất định được chỉ định trong không gian tham chiếu được truyền cho {{domxref("XRFrame.getViewerPose()")}}; đây được gọi là **không gian tham chiếu người xem**. Thuộc tính {{domxref("XRView.transform", "transform")}} mô tả vị trí và hướng của mắt hoặc máy ảnh được đại diện bởi `XRView`, được cho trong không gian tham chiếu đó.

### Lớp dựng hình đích

Để dựng hình một khung, bạn duyệt qua các chế độ xem của `XRViewerPose`, dựng mỗi chế độ vào viewport thích hợp trong {{domxref("XRWebGLLayer")}} của khung. Hiện tại, thông số kỹ thuật (và do đó tất cả các triển khai hiện tại của WebXR) được thiết kế xung quanh việc dựng mọi `XRView` vào một `XRWebGLLayer` duy nhất, sau đó được trình bày trên thiết bị XR với một nửa dùng cho mắt trái và một nửa cho mắt phải. {{domxref("XRViewport")}} cho mỗi chế độ xem được dùng để định vị việc dựng hình vào đúng nửa của lớp.

## Ví dụ

### Chuẩn bị dựng hình mọi chế độ xem cho một pose

Để vẽ mọi thứ người dùng nhìn thấy, mỗi khung hình yêu cầu duyệt qua danh sách các chế độ xem được trả về bởi danh sách {{domxref("XRViewerPose.views", "views")}} của đối tượng {{domxref("XRViewerPose")}}:

```js
for (const view of pose.views) {
  const viewport = glLayer.getViewport(view);

  gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

  // Draw the scene; the eye being drawn is identified
  // by view.eye.
}
```

### Các phép biến đổi chế độ xem đặc biệt

Có một số phép biến đổi đặc biệt được sử dụng trên chế độ xem khi dựng hình và chiếu sáng cảnh.

#### Ma trận model view

**Ma trận model view** là ma trận định nghĩa vị trí của một đối tượng so với không gian chứa nó: Nếu `objectMatrix` là phép biến đổi áp dụng cho đối tượng để cung cấp vị trí và xoay cơ bản của nó, thì ma trận model view có thể được tính bằng cách nhân ma trận của đối tượng với nghịch đảo của ma trận biến đổi chế độ xem, như sau:

```js
mat4.multiply(modelViewMatrix, view.transform.inverse.matrix, objectMatrix);
```

#### Ma trận pháp tuyến

**Ma trận pháp tuyến** của model view được sử dụng khi chiếu sáng cảnh, để biến đổi các vectơ pháp tuyến của mỗi bề mặt nhằm đảm bảo ánh sáng được phản chiếu đúng hướng. Nó được tính bằng cách đảo ngược rồi chuyển vị ma trận model view:

```js
mat4.invert(normalMatrix, modelViewMatrix);
mat4.transpose(normalMatrix, normalMatrix);
```

### Dịch chuyển một đối tượng

Để di chuyển và/hoặc xoay một đối tượng theo chương trình (thường được gọi là **teleporting**), bạn cần tạo một không gian tham chiếu mới cho đối tượng đó áp dụng phép biến đổi bao gồm các thay đổi mong muốn. Hàm `createTeleportTransform()` trả về phép biến đổi cần thiết để di chuyển và xoay đối tượng có tình huống hiện tại được mô tả bởi không gian tham chiếu `refSpace` đến một vị trí và hướng mới được tính toán bằng cách sử dụng dữ liệu đầu vào chuột và bàn phím đã ghi lại trước đó tạo ra các độ lệch cho yaw, pitch và vị trí trên cả ba trục.

```js
function applyMouseMovement(refSpace) {
  if (
    !mouseYaw &&
    !mousePitch &&
    !axialDistance &&
    !transverseDistance &&
    !verticalDistance
  ) {
    return refSpace;
  }

  // Compute the quaternion used to rotate the image based
  // on the pitch and yaw.

  quat.identity(inverseOrientation);
  quat.rotateX(inverseOrientation, inverseOrientation, -mousePitch);
  quat.rotateY(inverseOrientation, inverseOrientation, -mouseYaw);

  // Compute the true "up" vector for our object.

  vec3.cross(vecX, vecY, cubeOrientation);
  vec3.cross(vecY, cubeOrientation, vecX);

  // Now compute the transform that teleports the object to the
  // specified point and save a copy of it to display to the user
  // later; otherwise we probably wouldn't need to save mouseMatrix
  // at all.

  let newTransform = new XRRigidTransform(
    { x: transverseDistance, y: verticalDistance, z: axialDistance },
    {
      x: inverseOrientation[0],
      y: inverseOrientation[1],
      z: inverseOrientation[2],
      w: inverseOrientation[3],
    },
  );
  mat4.copy(mouseMatrix, newTransform.matrix);

  // Create a new reference space that transforms the object to the new
  // position and orientation, returning the new reference space.

  return refSpace.getOffsetReferenceSpace(newTransform);
}
```

Đoạn mã này được chia thành bốn phần. Ở phần đầu tiên, quaternion `inverseOrientation` được tính. Đây là phép xoay của đối tượng dựa trên các giá trị của `mousePitch` (xoay quanh trục X của không gian tham chiếu đối tượng) và `mouseYaw` (xoay quanh trục Y của đối tượng).

Phần thứ hai tính toán vectơ "lên" của đối tượng. Vectơ này chỉ hướng "lên" trong cảnh tổng thể, nhưng trong không gian tham chiếu của đối tượng.

Phần thứ ba tạo ra {{domxref("XRRigidTransform")}} mới, chỉ định một điểm cung cấp độ lệch dọc ba trục làm tham số đầu tiên và quaternion hướng làm tham số thứ hai. Thuộc tính {{domxref("XRRigidTransform.matrix", "matrix")}} của đối tượng được trả về là ma trận thực sự biến đổi các điểm từ không gian tham chiếu của cảnh sang vị trí mới của đối tượng.

Cuối cùng, một không gian tham chiếu mới được tạo để mô tả đầy đủ mối quan hệ giữa hai không gian tham chiếu. Không gian tham chiếu đó được trả về cho người gọi.

Để sử dụng hàm này, chúng ta truyền không gian tham chiếu được trả về vào {{domxref("XRFrame.getPose()")}} hoặc {{domxref("XRFrame.getViewerPose", "getViewerPose()")}}, tùy theo nhu cầu. {{domxref("XRPose")}} được trả về sẽ được dùng để dựng cảnh cho khung hình hiện tại.

Bạn có thể tìm thấy ví dụ đầy đủ hơn trong bài viết [Movement, orientation, and motion](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
