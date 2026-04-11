---
title: Using VR controllers with WebVR
slug: Web/API/WebVR_API/Using_VR_controllers_with_WebVR
page-type: guide
---

{{DefaultAPISidebar("WebVR API")}}

Nhiều cấu hình phần cứng WebVR có các bộ điều khiển đi kèm với headset. Chúng có thể được dùng trong ứng dụng WebVR thông qua [Gamepad API](/en-US/docs/Web/API/Gamepad_API), và cụ thể là [Gamepad Extensions API](/en-US/docs/Web/API/Gamepad_API#experimental_gamepad_extensions), API này bổ sung các tính năng để truy cập [controller pose](/en-US/docs/Web/API/GamepadPose), [haptic actuators](/en-US/docs/Web/API/GamepadHapticActuator), và nhiều hơn nữa. Bài viết này giải thích những điều cơ bản.

> [!NOTE]
> WebVR API được thay thế bởi [WebXR API](/en-US/docs/Web/API/WebXR_Device_API). WebVR chưa bao giờ được phê chuẩn thành một tiêu chuẩn, chỉ được triển khai và bật mặc định trong rất ít trình duyệt, và chỉ hỗ trợ một số ít thiết bị.

## WebVR API

[WebVR API](/en-US/docs/Web/API/WebVR_API) là một tính năng mới của nền tảng web, còn khá non trẻ nhưng rất thú vị, cho phép nhà phát triển tạo ra các trải nghiệm thực tế ảo dựa trên web. Nó làm điều này bằng cách cung cấp quyền truy cập tới các headset VR được kết nối với máy tính của bạn dưới dạng các đối tượng {{domxref("VRDisplay")}}, có thể được thao tác để bắt đầu và dừng trình chiếu lên màn hình, truy vấn dữ liệu chuyển động (ví dụ: orientation và position) có thể dùng để cập nhật màn hình ở mỗi khung của vòng lặp animation, và nhiều hơn nữa.

Trước khi đọc bài viết này, bạn thực sự nên đã quen với những điều cơ bản của WebVR API - hãy đọc [Using the WebVR API](/en-US/docs/Web/API/WebVR_API/Using_the_WebVR_API) trước, nếu bạn chưa làm vậy, vì bài đó cũng trình bày chi tiết về hỗ trợ trình duyệt và thiết lập phần cứng cần thiết.

## Gamepad API

[Gamepad API](/en-US/docs/Web/API/Gamepad_API) là một API được hỗ trợ khá tốt, cho phép nhà phát triển truy cập các gamepad/bộ điều khiển được kết nối với máy tính và dùng chúng để điều khiển ứng dụng web. Gamepad API cơ bản cung cấp quyền truy cập tới các bộ điều khiển đã kết nối dưới dạng các đối tượng {{domxref("Gamepad")}}, rồi có thể truy vấn để biết nút nào đang được nhấn, thumbstick nào (axes) đang được di chuyển tại bất kỳ thời điểm nào, v.v.

Bạn có thể tìm hiểu thêm về cách dùng Gamepad API cơ bản trong [Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API) và [Implementing controls using the Gamepad API](/en-US/docs/Games/Techniques/Controls_Gamepad_API).

Tuy nhiên, trong bài viết này chúng ta chủ yếu sẽ tập trung vào một số tính năng mới do [Gamepad Extensions](https://w3c.github.io/gamepad/extensions.html) API cung cấp, cho phép truy cập thông tin bộ điều khiển nâng cao như dữ liệu vị trí và hướng, điều khiển haptic actuators (ví dụ: phần cứng rung), và nhiều hơn nữa. API này còn rất mới, và hiện chỉ được hỗ trợ cũng như bật mặc định trong các kênh Firefox 55+ Beta/Nightly.

## Các loại bộ điều khiển

Có hai loại bộ điều khiển bạn sẽ gặp với phần cứng VR:

- Bộ điều khiển 6DoF (sáu bậc tự do) cung cấp cả dữ liệu vị trí lẫn hướng - chúng có thể thao tác cảnh VR và các đối tượng bên trong nó bằng chuyển động và cả xoay. Một ví dụ tốt là bộ điều khiển HTC VIVE.
- Bộ điều khiển 3DoF (ba bậc tự do) cung cấp dữ liệu hướng nhưng không có dữ liệu vị trí. Một ví dụ tốt là bộ điều khiển Google Daydream, có thể xoay để chỉ vào các thứ khác nhau trong không gian 3D như một đèn laser, nhưng không thể di chuyển bên trong cảnh 3D.

## Truy cập bộ điều khiển cơ bản

Bây giờ đến phần mã. Hãy xem trước cách cơ bản để chúng ta truy cập bộ điều khiển VR với Gamepad API. Ở đây có một vài chi tiết lạ cần lưu ý, nên rất đáng để xem qua.

Chúng tôi đã viết một ví dụ để minh họa - xem mã nguồn [vr-controller-basic-info](https://github.com/mdn/webvr-tests/blob/main/webvr/vr-controller-basic-info/index.html) của chúng tôi ([xem chạy trực tiếp ở đây](https://mdn.github.io/webvr-tests/webvr/vr-controller-basic-info/)). Demo này xuất thông tin về các màn hình VR và gamepad được kết nối với máy tính của bạn.

### Lấy thông tin hiển thị

Đoạn mã đáng chú ý đầu tiên như sau:

```js
let initialRun = true;

if (navigator.getVRDisplays && navigator.getGamepads) {
  info.textContent = "WebVR API and Gamepad API supported.";
  reportDisplays();
} else {
  info.textContent =
    "WebVR API and/or Gamepad API not supported by this browser.";
}
```

Ở đây trước tiên chúng ta dùng biến theo dõi `initialRun` để ghi nhận đây là lần đầu tiên tải trang. Bạn sẽ tìm hiểu thêm về điều này ở phần sau. Tiếp theo, chúng ta phát hiện xem WebVR và Gamepad APIs có được hỗ trợ hay không bằng cách kiểm tra sự tồn tại của các phương thức {{domxref("Navigator.getVRDisplays()")}} và {{domxref("Navigator.getGamepads()")}}. Nếu có, chúng ta chạy hàm tùy chỉnh `reportDisplays()` để bắt đầu quá trình. Hàm này trông như sau:

```js
function reportDisplays() {
  navigator.getVRDisplays().then((displays) => {
    console.log(`${displays.length} displays`);
    displays.forEach((display, i) => {
      const cap = display.capabilities;
      // cap is a VRDisplayCapabilities object
      const listItem = document.createElement("li");
      listItem.innerText = `
VR Display ID: ${display.displayId}
VR Display Name: ${display.displayName}
Display can present content: ${cap.canPresent}
Display is separate from the computer's main display: ${cap.hasExternalDisplay}
Display can return position info: ${cap.hasPosition}
Display can return orientation info: ${cap.hasOrientation}
Display max layers: ${cap.maxLayers}`;
      listItem.insertBefore(
        document.createElement("strong"),
        listItem.firstChild,
      ).textContent = `Display ${i + 1}`;
      list.appendChild(listItem);
    });

    setTimeout(reportGamepads, 1000);
    // For VR, controllers will only be active after their corresponding headset is active
  });
}
```

Hàm này trước tiên dùng phương thức {{domxref("Navigator.getVRDisplays()")}} dựa trên promise, phương thức này resolve với một mảng chứa các đối tượng {{domxref("VRDisplay")}} đại diện cho các màn hình được kết nối. Tiếp theo, nó in ra các giá trị {{domxref("VRDisplay.displayId")}} và {{domxref("VRDisplay.displayName")}} của từng màn hình, cùng một số giá trị hữu ích nằm trong đối tượng {{domxref("VRDisplayCapabilities")}} liên kết của màn hình. Những giá trị hữu ích nhất là {{domxref("VRDisplayCapabilities.hasOrientation","hasOrientation")}} và {{domxref("VRDisplayCapabilities.hasPosition","hasPosition")}}, cho phép bạn phát hiện xem thiết bị có thể trả về dữ liệu hướng và vị trí hay không, rồi thiết lập ứng dụng cho phù hợp.

Dòng cuối cùng trong hàm này là lời gọi {{domxref("Window.setTimeout", "setTimeout()")}}, chạy hàm `reportGamepads()` sau 1 giây trì hoãn. Tại sao chúng ta cần điều này? Trước hết, bộ điều khiển VR chỉ sẵn sàng sau khi headset VR liên kết của chúng đã hoạt động, vì vậy ta cần gọi nó sau khi `getVRDisplays()` đã chạy và trả về thông tin màn hình. Thứ hai, Gamepad API cũ hơn nhiều so với WebVR API, và không dựa trên promise. Như bạn sẽ thấy sau đây, phương thức `getGamepads()` là đồng bộ, và chỉ trả về ngay các đối tượng `Gamepad` - nó không chờ bộ điều khiển sẵn sàng để báo cáo thông tin. Nếu bạn không đợi một chút, thông tin trả về có thể không chính xác (ít nhất là theo những gì chúng tôi thấy trong các bài kiểm tra).

### Lấy thông tin Gamepad

Hàm `reportGamepads()` trông như sau:

```js
function reportGamepads() {
  const gamepads = navigator.getGamepads();
  console.log(`${gamepads.length} controllers`);
  for (const gp of gamepads) {
    const listItem = document.createElement("li");
    listItem.classList = "gamepad";
    listItem.innerText = `
Associated with VR Display ID: ${gp.displayId}
Gamepad associated with which hand: ${gp.hand}
Available haptic actuators: ${gp.hapticActuators.length}
Gamepad can return position info: ${gp.pose.hasPosition}
Gamepad can return orientation info: ${gp.pose.hasOrientation}`;
    listItem.insertBefore(
      document.createElement("strong"),
      listItem.firstChild,
    ).textContent = `Gamepad ${gp.index}`;
    list.appendChild(listItem);
  }
  initialRun = false;
}
```

Điều này hoạt động tương tự như `reportDisplays()` - chúng ta lấy một mảng các đối tượng {{domxref("Gamepad")}} bằng phương thức `getGamepads()` không dựa trên promise, rồi lần lượt đi qua từng mục và in thông tin của từng cái:

- Thuộc tính {{domxref("Gamepad.displayId")}} giống với `displayId` của headset mà bộ điều khiển gắn với, vì vậy hữu ích để liên kết thông tin của controller và headset.
- Thuộc tính {{domxref("Gamepad.index")}} là chỉ số số duy nhất xác định từng bộ điều khiển được kết nối.
- {{domxref("Gamepad.hand")}} trả về tay mà bộ điều khiển được dự kiến cầm.
- {{domxref("Gamepad.hapticActuators")}} trả về một mảng các haptic actuators có sẵn trong bộ điều khiển. Ở đây chúng ta trả về độ dài của nó để xem mỗi cái có bao nhiêu cái sẵn có.
- Cuối cùng, chúng ta trả về {{domxref("GamepadPose.hasPosition")}} và {{domxref("GamepadPose.hasOrientation")}} để cho thấy bộ điều khiển có thể trả về dữ liệu vị trí và hướng hay không. Điều này hoạt động giống hệt như với màn hình, ngoại trừ việc trong trường hợp gamepad, các giá trị này có trên đối tượng pose chứ không phải đối tượng capabilities.

Lưu ý rằng chúng ta cũng gán class `gamepad` cho mỗi mục danh sách chứa thông tin controller. Chúng ta sẽ giải thích việc này để làm gì ở phần sau.

Việc cuối cùng ở đây là đặt biến `initialRun` thành `false`, vì lần chạy đầu tiên đã kết thúc.

### Sự kiện Gamepad

Để kết thúc phần này, chúng ta sẽ xem các sự kiện liên quan đến gamepad. Có hai sự kiện cần quan tâm - {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}} - và khá rõ chúng làm gì.

Ở cuối ví dụ, đầu tiên chúng ta đưa vào hàm `removeGamepads()`:

```js
function removeGamepads() {
  const gpLi = document.querySelectorAll(".gamepad");
  for (const li of gpLi) {
    list.removeChild(li);
  }
  reportGamepads();
}
```

Hàm này lấy tham chiếu tới tất cả phần tử list có class name `gamepad`, và xóa chúng khỏi DOM. Sau đó nó chạy lại `reportGamepads()` để điền danh sách với danh sách controller đã kết nối được cập nhật.

`removeGamepads()` sẽ được chạy mỗi khi gamepad được kết nối hoặc ngắt kết nối, thông qua các bộ xử lý sự kiện sau:

```js
window.addEventListener("gamepadconnected", (e) => {
  info.textContent = `Gamepad ${e.gamepad.index} connected.`;
  if (!initialRun) {
    setTimeout(removeGamepads, 1000);
  }
});

window.addEventListener("gamepaddisconnected", (e) => {
  info.textContent = `Gamepad ${e.gamepad.index} disconnected.`;
  setTimeout(removeGamepads, 1000);
});
```

Chúng ta dùng các lời gọi `setTimeout()` ở đây - giống như đã làm với mã khởi tạo ở đầu script - để bảo đảm gamepad sẵn sàng báo cáo thông tin khi `reportGamepads()` được gọi trong từng trường hợp.

Nhưng còn một điều nữa cần lưu ý - bạn sẽ thấy rằng bên trong trình xử lý `gamepadconnected`, timeout chỉ chạy nếu `initialRun` là `false`. Điều này là vì nếu gamepad của bạn đã được kết nối khi tài liệu lần đầu tải, `gamepadconnected` sẽ được kích hoạt một lần cho mỗi gamepad, nên `removeGamepads()`/`reportGamepads()` sẽ chạy nhiều lần. Điều này có thể dẫn đến kết quả không chính xác, vì vậy chúng ta chỉ muốn chạy `removeGamepads()` trong trình xử lý `gamepadconnected` sau lần chạy đầu tiên, không phải trong đó. Đó là lý do của `initialRun`.
