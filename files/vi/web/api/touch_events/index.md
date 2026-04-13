---
title: Touch events
slug: Web/API/Touch_events
page-type: web-api-overview
browser-compat:
  - api.Touch
  - api.TouchEvent
  - api.TouchList
spec-urls: https://w3c.github.io/touch-events/
---

{{DefaultAPISidebar("Touch Events")}}

Để cung cấp hỗ trợ chất lượng cao cho các giao diện người dùng dựa trên cảm ứng, các sự kiện cảm ứng cung cấp khả năng diễn giải hoạt động của ngón tay (hoặc bút cảm ứng) trên màn hình cảm ứng hoặc touchpad.

Các giao diện sự kiện cảm ứng là các API tương đối cấp thấp có thể được sử dụng để hỗ trợ các tương tác đa chạm đặc thù cho ứng dụng như cử chỉ hai ngón tay. Tương tác đa chạm bắt đầu khi một ngón tay (hoặc bút cảm ứng) chạm vào bề mặt tiếp xúc. Các ngón tay khác sau đó có thể chạm vào bề mặt và tùy chọn di chuyển qua bề mặt cảm ứng. Tương tác kết thúc khi các ngón tay được nhấc khỏi bề mặt. Trong suốt tương tác này, một ứng dụng nhận các sự kiện cảm ứng trong các giai đoạn bắt đầu, di chuyển và kết thúc.

Các sự kiện cảm ứng tương tự như các sự kiện chuột ngoại trừ chúng hỗ trợ các lần chạm đồng thời và ở các vị trí khác nhau trên bề mặt cảm ứng. Giao diện {{domxref("TouchEvent")}} đóng gói tất cả các điểm chạm hiện đang hoạt động. Giao diện {{domxref("Touch")}}, đại diện cho một điểm chạm đơn, bao gồm thông tin như vị trí của điểm chạm tương đối với khung nhìn trình duyệt.

## Định nghĩa

- Bề mặt
  - : Bề mặt nhạy cảm với cảm ứng. Đây có thể là màn hình hoặc touchpad.
- Điểm chạm
  - : Điểm tiếp xúc với bề mặt. Đây có thể là ngón tay (hoặc khuỷu tay, tai, mũi, bất cứ thứ gì, nhưng thường là ngón tay) hoặc bút cảm ứng.

## Giao diện

- {{domxref("TouchEvent")}}
  - : Đại diện cho một sự kiện xảy ra khi trạng thái của các lần chạm trên bề mặt thay đổi.
- {{domxref("Touch")}}
  - : Đại diện cho một điểm tiếp xúc đơn giữa người dùng và bề mặt cảm ứng.
- {{domxref("TouchList")}}
  - : Đại diện cho một nhóm các lần chạm; điều này được sử dụng khi người dùng, ví dụ, có nhiều ngón tay trên bề mặt cùng lúc.

## Ví dụ

> [!NOTE]
> Văn bản bên dưới sử dụng thuật ngữ "ngón tay" khi mô tả tiếp xúc với bề mặt, nhưng tất nhiên, nó cũng có thể là bút cảm ứng hoặc phương thức tiếp xúc khác.

### Ứng dụng vẽ

Ví dụ này theo dõi nhiều điểm chạm cùng lúc, cho phép người dùng vẽ trong {{HTMLElement("canvas")}} với nhiều hơn một ngón tay cùng lúc. Nó chỉ hoạt động trên trình duyệt hỗ trợ các sự kiện cảm ứng.

#### Tạo canvas

HTML bao gồm một phần tử {{HTMLElement("canvas")}} đơn. Các đường cong sẽ được vẽ để đáp ứng các cử chỉ cảm ứng của người dùng. Một nút cũng được bao gồm để xóa canvas.

```html
<canvas id="canvas" width="600" height="600">
  Your browser does not support the canvas element.
</canvas>
<button id="clear">Clear canvas</button>
```

```css
#canvas {
  border: 1px solid black;
  display: block;
}
```

#### Theo dõi các lần chạm mới

Chúng ta sẽ theo dõi tất cả các lần chạm đang diễn ra và vẽ đường cho mỗi lần.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Mapping from the pointerId to the current finger position
const ongoingTouches = new Map();
```

Khi sự kiện {{domxref("Element/touchstart_event", "touchstart")}} xảy ra, cho biết có lần chạm mới trên bề mặt, hàm `handleStart()` bên dưới được gọi.

```js
function handleStart(event) {
  event.preventDefault();

  for (const changedTouch of event.changedTouches) {
    const touch = {
      pageX: changedTouch.pageX,
      pageY: changedTouch.pageY,
      color: colorForTouch(changedTouch),
    };
    ongoingTouches.set(changedTouch.identifier, touch);
    ctx.beginPath();
    ctx.arc(touch.pageX, touch.pageY, 4, 0, 2 * Math.PI, false);
    ctx.fillStyle = touch.color;
    ctx.fill();
  }
}

canvas.addEventListener("touchstart", handleStart);
```

Hàm này gọi {{domxref("event.preventDefault()")}} để ngăn trình duyệt tiếp tục xử lý sự kiện cảm ứng (điều này cũng ngăn sự kiện chuột được phân phối). Sau đó chúng ta lấy ngữ cảnh và lấy danh sách các điểm chạm đã thay đổi từ thuộc tính {{domxref("TouchEvent.changedTouches")}} của sự kiện.

Sau đó, chúng ta lặp qua tất cả các đối tượng {{domxref("Touch")}} trong danh sách, đẩy chúng vào mảng các điểm chạm đang hoạt động và vẽ điểm bắt đầu cho bản vẽ dưới dạng vòng tròn nhỏ; chúng ta đang sử dụng đường rộng 4 pixel, vì vậy vòng tròn bán kính 4 pixel sẽ hiển thị gọn.

Để làm cho bản vẽ của mỗi lần chạm trông khác nhau, hàm `colorForTouch()` được sử dụng để chọn màu dựa trên định danh duy nhất của lần chạm.
Định danh này là một số mờ, nhưng chúng ta ít nhất có thể dựa vào nó khác nhau giữa các lần chạm hiện đang hoạt động.

```js
function colorForTouch(touch) {
  const r = touch.identifier % 16;
  const g = Math.floor(touch.identifier / 3) % 16;
  const b = Math.floor(touch.identifier / 7) % 16;
  // convert to hex digits
  return `#${r.toString(16)}${g.toString(16)}${b.toString(16)}`;
}
```

Kết quả từ hàm này là một chuỗi có thể được sử dụng khi gọi các hàm {{HTMLElement("canvas")}} để đặt màu vẽ.
Ví dụ, với giá trị {{domxref("Touch.identifier")}} là 10, chuỗi kết quả là "#aa3311".

#### Xử lý kết thúc lần chạm

Khi người dùng nhấc ngón tay khỏi bề mặt, sự kiện {{domxref("Element/touchend_event", "touchend")}} được gửi. Chúng ta xử lý điều này bằng cách gọi hàm `handleEnd()` bên dưới. Công việc của nó là vẽ đoạn đường cuối cùng cho mỗi lần chạm kết thúc và xóa điểm chạm khỏi bản đồ lần chạm đang diễn ra.

```js
function handleEnd(event) {
  event.preventDefault();

  for (const changedTouch of event.changedTouches) {
    const touch = ongoingTouches.get(changedTouch.identifier);
    if (!touch) {
      console.error(`End: Could not find touch ${changedTouch.identifier}`);
      continue;
    }
    ctx.lineWidth = 4;
    ctx.fillStyle = touch.color;
    ctx.beginPath();
    ctx.moveTo(touch.pageX, touch.pageY);
    ctx.lineTo(changedTouch.pageX, changedTouch.pageY);
    ctx.fillRect(changedTouch.pageX - 4, changedTouch.pageY - 4, 8, 8);
    ongoingTouches.delete(changedTouch.identifier);
  }
}

canvas.addEventListener("touchend", handleEnd);
```

Điều này rất giống với hàm trước; sự khác biệt thực sự duy nhất là chúng ta vẽ một hình vuông nhỏ để đánh dấu kết thúc và khi chúng ta gọi [`Map.delete()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/delete), chúng ta xóa mục cũ khỏi bản đồ lần chạm đang diễn ra, mà không thêm thông tin cập nhật vào. Kết quả là chúng ta dừng theo dõi điểm chạm đó.

#### Xử lý lần chạm bị hủy

Nếu ngón tay người dùng lang thang vào giao diện người dùng trình duyệt, hoặc lần chạm cần bị hủy, sự kiện {{domxref("Element/touchcancel_event", "touchcancel")}} được gửi, và chúng ta gọi hàm `handleCancel()` bên dưới.

```js
function handleCancel(event) {
  event.preventDefault();

  for (const changedTouch of event.changedTouches) {
    if (!ongoingTouches.has(changedTouch.identifier)) {
      console.error(`Cancel: Could not find touch ${changedTouch.identifier}`);
      continue;
    }
    ongoingTouches.delete(changedTouch.identifier);
  }
}

canvas.addEventListener("touchcancel", handleCancel);
```

Vì ý tưởng là hủy bỏ lần chạm ngay lập tức, chúng ta xóa nó khỏi bản đồ lần chạm đang diễn ra mà không vẽ đoạn đường cuối cùng.

#### Vẽ khi lần chạm di chuyển

Mỗi khi một hoặc nhiều ngón tay di chuyển, sự kiện {{domxref("Element/touchmove_event", "touchmove")}} được phân phối, dẫn đến hàm `handleMove()` của chúng ta được gọi. Trách nhiệm của nó trong ví dụ này là cập nhật thông tin lần chạm được lưu trong bộ nhớ cache và vẽ đường từ vị trí trước đó đến vị trí hiện tại của mỗi lần chạm.

```js
function handleMove(event) {
  event.preventDefault();

  for (const changedTouch of event.changedTouches) {
    const touch = ongoingTouches.get(changedTouch.identifier);

    if (!touch) {
      console.error(`Move: Could not find touch ${changedTouch.identifier}`);
      continue;
    }

    ctx.beginPath();
    ctx.moveTo(touch.pageX, touch.pageY);
    ctx.lineTo(changedTouch.pageX, changedTouch.pageY);
    ctx.lineWidth = 4;
    ctx.strokeStyle = touch.color;
    ctx.stroke();

    const newTouch = {
      pageX: changedTouch.pageX,
      pageY: changedTouch.pageY,
      color: touch.color,
    };

    ongoingTouches.set(changedTouch.identifier, newTouch);
  }
}

canvas.addEventListener("touchmove", handleMove);
```

Hàm này lặp qua các lần chạm đã thay đổi, nhưng nó tìm kiếm trong mảng thông tin lần chạm được lưu trong bộ nhớ cache của chúng ta thông tin trước đó về mỗi lần chạm để xác định điểm bắt đầu cho đoạn đường mới của mỗi lần chạm cần được vẽ. Điều này được thực hiện bằng cách xem thuộc tính {{domxref("Touch.identifier")}} của mỗi lần chạm. Thuộc tính này là một số nguyên duy nhất cho mỗi lần chạm và vẫn nhất quán cho mỗi sự kiện trong suốt thời gian tiếp xúc của mỗi ngón tay với bề mặt.

Điều này cho phép chúng ta lấy tọa độ của vị trí trước đó của mỗi lần chạm và sử dụng các phương thức ngữ cảnh thích hợp để vẽ đoạn đường nối hai vị trí.

Sau khi vẽ đường, chúng ta gọi [`Map.set()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/set) để thay thế thông tin trước đó về điểm chạm bằng thông tin hiện tại trong bản đồ `touches`.

#### Nút xóa

Cuối cùng, thêm chức năng xóa.

```js
document.getElementById("clear").addEventListener("click", () => {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
});
```

### Kết quả

Bạn có thể kiểm tra ví dụ này trên thiết bị di động bằng cách chạm vào hộp bên dưới.

{{EmbedLiveSample('drawing application','100%', 900)}}

> [!NOTE]
> Nói chung hơn, ví dụ sẽ hoạt động trên các nền tảng cung cấp sự kiện cảm ứng.
> Bạn có thể kiểm tra điều này trên các nền tảng máy tính để bàn có thể mô phỏng các sự kiện đó:
>
> - Trên Firefox kích hoạt "touch simulation" trong [Responsive Design Mode](https://firefox-source-docs.mozilla.org/devtools-user/responsive_design_mode/index.html#toggling-responsive-design-mode) (bạn có thể cần tải lại trang).
> - Trên Chrome sử dụng [Device mode](https://developer.chrome.com/docs/devtools/device-mode/) và đặt [Device type](https://developer.chrome.com/docs/devtools/device-mode/#type) thành loại gửi sự kiện cảm ứng.

## Mẹo bổ sung

Phần này cung cấp các mẹo bổ sung về cách xử lý sự kiện cảm ứng trong ứng dụng web của bạn.

### Xử lý click

Vì việc gọi `preventDefault()` trên sự kiện {{domxref("Element/touchstart_event", "touchstart")}} hoặc sự kiện {{domxref("Element/touchmove_event", "touchmove")}} đầu tiên trong một chuỗi ngăn các sự kiện chuột tương ứng kích hoạt, thường gọi `preventDefault()` trên `touchmove` thay vì `touchstart`. Theo cách đó, các sự kiện chuột vẫn có thể kích hoạt và những thứ như liên kết sẽ tiếp tục hoạt động. Ngoài ra, một số framework đã chuyển sang kích hoạt lại các sự kiện cảm ứng dưới dạng sự kiện chuột cho cùng mục đích này. (Ví dụ này được đơn giản hóa quá mức và có thể dẫn đến hành vi kỳ lạ. Nó chỉ nhằm mục đích làm hướng dẫn.)

```js
function onTouch(event) {
  event.preventDefault();

  if (
    event.touches.length > 1 ||
    (event.type === "touchend" && event.touches.length > 0)
  )
    return;

  let type;
  let touch;

  switch (event.type) {
    case "touchstart":
      type = "mousedown";
      touch = event.changedTouches[0];
      break;
    case "touchmove":
      type = "mousemove";
      touch = event.changedTouches[0];
      break;
    case "touchend":
      type = "mouseup";
      touch = event.changedTouches[0];
      break;
  }

  const newEvent = new MouseEvent(type, {
    bubbles: true,
    cancelable: true,
    view: event.originalTarget.ownerDocument.defaultView,
    detail: 0,
    screenX: touch.screenX,
    screenY: touch.screenY,
    clientX: touch.clientX,
    clientY: touch.clientY,
    ctrlKey: event.ctrlKey,
    altKey: event.altKey,
    shiftKey: event.shiftKey,
    metaKey: event.metaKey,
    button: 0,
    relatedTarget: null,
  });

  event.originalTarget.dispatchEvent(newEvent);
}
```

### Gọi preventDefault() chỉ trên lần chạm thứ hai

Một kỹ thuật để ngăn những thứ như `pinchZoom` trên trang là gọi `preventDefault()` trên lần chạm thứ hai trong chuỗi. Hành vi này không được định nghĩa rõ ràng trong spec sự kiện cảm ứng và dẫn đến hành vi khác nhau trên các trình duyệt khác nhau (tức là, iOS sẽ ngăn zoom nhưng vẫn cho phép kéo với cả hai ngón tay; Android sẽ cho phép zoom nhưng không kéo; Opera và Firefox hiện tại ngăn tất cả kéo và zoom). Hiện tại, không nên phụ thuộc vào bất kỳ hành vi cụ thể nào trong trường hợp này mà thay vào đó phụ thuộc vào meta viewport để ngăn zoom.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Các sự kiện cảm ứng thường có sẵn trên các thiết bị có màn hình cảm ứng, nhưng nhiều trình duyệt làm cho API sự kiện cảm ứng không khả dụng trên tất cả thiết bị máy tính để bàn, ngay cả những thiết bị có màn hình cảm ứng.

Lý do cho điều này là một số trang web sử dụng sự có sẵn của các phần của API sự kiện cảm ứng như một chỉ báo rằng trình duyệt đang chạy trên thiết bị di động. Nếu API sự kiện cảm ứng có sẵn, các trang web này sẽ giả định thiết bị di động và phục vụ nội dung được tối ưu hóa cho di động. Điều này sau đó có thể cung cấp trải nghiệm kém cho người dùng thiết bị máy tính để bàn có màn hình cảm ứng.

Để hỗ trợ cả cảm ứng và chuột trên tất cả loại thiết bị, hãy sử dụng [sự kiện con trỏ](/en-US/docs/Web/API/Pointer_events) thay thế.

{{Compat}}
