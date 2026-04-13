---
title: Tương tác đa chạm
slug: Web/API/Touch_events/Multi-touch_interaction
page-type: guide
---

{{DefaultAPISidebar("Touch Events")}}

Các giao diện sự kiện cảm ứng hỗ trợ các tương tác đơn và đa chạm đặc thù cho ứng dụng. Tuy nhiên, các giao diện có thể hơi khó sử dụng đối với lập trình viên vì các sự kiện cảm ứng rất khác với các sự kiện đầu vào DOM khác, như [sự kiện chuột](/en-US/docs/Web/API/MouseEvent). Ứng dụng được mô tả trong hướng dẫn này cho thấy cách sử dụng sự kiện cảm ứng cho các tương tác đơn và đa chạm đơn giản, các kiến thức cơ bản cần thiết để xây dựng các cử chỉ đặc thù cho ứng dụng.

Phiên bản _trực tiếp_ của ứng dụng này có sẵn trên [GitHub](https://mdn.github.io/dom-examples/touchevents/Multi-touch_interaction.html). [Mã nguồn có sẵn trên GitHub](https://github.com/mdn/dom-examples/tree/main/touchevents) và các pull request và [báo cáo lỗi](https://github.com/mdn/dom-examples/issues) được hoan nghênh.

## Ví dụ

Ví dụ này thể hiện việc sử dụng sự kiện {{domxref("Element/touchstart_event", "touchstart")}}, {{domxref("Element/touchmove_event", "touchmove")}}, {{domxref("Element/touchcancel_event", "touchcancel")}} và {{domxref("Element/touchend_event", "touchend")}}) cho các cử chỉ sau: chạm đơn, hai lần chạm (đồng thời), nhiều hơn hai lần chạm đồng thời, vuốt 1 ngón tay, và di chuyển/kẹp/vuốt 2 ngón tay.

### Định nghĩa vùng chạm

Ứng dụng sử dụng các phần tử {{HTMLElement("div")}} để đại diện cho bốn vùng chạm.

```css
div {
  margin: 0em;
  padding: 2em;
}
#target1 {
  background: white;
  border: 1px solid black;
}
#target2 {
  background: white;
  border: 1px solid black;
}
#target3 {
  background: white;
  border: 1px solid black;
}
#target4 {
  background: white;
  border: 1px solid black;
}
```

### Trạng thái toàn cục

`tpCache` được sử dụng để lưu vào bộ nhớ cache các điểm chạm để xử lý bên ngoài sự kiện nơi chúng được kích hoạt.

```js
// Log events flag
let logEvents = false;

// Touch Point cache
const tpCache = [];
```

### Đăng ký trình xử lý sự kiện

Các trình xử lý sự kiện được đăng ký cho cả bốn loại sự kiện cảm ứng. Loại sự kiện {{domxref("Element/touchend_event", "touchend")}} và {{domxref("Element/touchcancel_event", "touchcancel")}} sử dụng cùng một trình xử lý.

```js
function setHandlers(name) {
  // Install event handlers for the given element
  const el = document.getElementById(name);
  el.addEventListener("touchstart", startHandler);
  el.addEventListener("touchmove", moveHandler);
  // Use same handler for touchcancel and touchend
  el.addEventListener("touchcancel", endHandler);
  el.addEventListener("touchend", endHandler);
}

function init() {
  setHandlers("target1");
  setHandlers("target2");
  setHandlers("target3");
  setHandlers("target4");
}
```

### Trình xử lý di chuyển/kẹp/zoom

Hàm này cung cấp hỗ trợ rất cơ bản cho xử lý di chuyển/kẹp/zoom ngang 2 lần chạm. Mã không bao gồm xử lý lỗi, chỉ xử lý di chuyển ngang, v.v. Lưu ý rằng _ngưỡng_ để phát hiện chuyển động kẹp và zoom phụ thuộc vào ứng dụng (và phụ thuộc vào thiết bị).

```js
// This is a very basic 2-touch move/pinch/zoom handler that does not include
// error handling, only handles horizontal moves, etc.
function handlePinchZoom(ev) {
  if (ev.targetTouches.length === 2 && ev.changedTouches.length === 2) {
    // Check if the two target touches are the same ones that started
    // the 2-touch
    const point1 = tpCache.findLastIndex(
      (tp) => tp.identifier === ev.targetTouches[0].identifier,
    );
    const point2 = tpCache.findLastIndex(
      (tp) => tp.identifier === ev.targetTouches[1].identifier,
    );

    if (point1 >= 0 && point2 >= 0) {
      // Calculate the difference between the start and move coordinates
      const diff1 = Math.abs(
        tpCache[point1].clientX - ev.targetTouches[0].clientX,
      );
      const diff2 = Math.abs(
        tpCache[point2].clientX - ev.targetTouches[1].clientX,
      );

      // This threshold is device dependent as well as application specific
      const PINCH_THRESHOLD = ev.target.clientWidth / 10;
      if (diff1 >= PINCH_THRESHOLD && diff2 >= PINCH_THRESHOLD)
        ev.target.style.background = "green";
    } else {
      // empty tpCache
      tpCache.length = 0;
    }
  }
}
```

### Trình xử lý touchstart

Trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} lưu vào bộ nhớ cache các điểm chạm để hỗ trợ cử chỉ 2 lần chạm. Nó cũng gọi {{domxref("Event.preventDefault","preventDefault()")}} để ngăn trình duyệt áp dụng xử lý sự kiện thêm (ví dụ, mô phỏng sự kiện chuột).

```js
function startHandler(ev) {
  // If the user makes simultaneous touches, the browser will fire a
  // separate touchstart event for each touch point. Thus if there are
  // three simultaneous touches, the first touchstart event will have
  // targetTouches length of one, the second event will have a length
  // of two, and so on.
  ev.preventDefault();
  // Cache the touch points for later processing of 2-touch pinch/zoom
  if (ev.targetTouches.length === 2) {
    for (const touch of ev.targetTouches) {
      tpCache.push(touch);
    }
  }
  if (logEvents) log("touchStart", ev, true);
  updateBackground(ev);
}
```

### Trình xử lý touchmove

Trình xử lý {{domxref("Element/touchmove_event", "touchmove")}} gọi {{domxref("Event.preventDefault","preventDefault()")}} vì lý do tương tự như đã đề cập ở trên và gọi trình xử lý kẹp/zoom.

```js
function moveHandler(ev) {
  // Note: if the user makes more than one "simultaneous" touches, most browsers
  // fire at least one touchmove event and some will fire several touch moves.
  // Consequently, an application might want to "ignore" some touch moves.
  //
  // This function sets the target element's border to "dashed" to visually
  // indicate the target received a move event.
  //
  ev.preventDefault();
  if (logEvents) log("touchMove", ev, false);
  // To avoid too much color flashing many touchmove events are started,
  // don't update the background if two touch points are active
  if (!(ev.touches.length === 2 && ev.targetTouches.length === 2))
    updateBackground(ev);

  // Set the target element's border to dashed to give a clear visual
  // indication the element received a move event.
  ev.target.style.border = "dashed";

  // Check this event for 2-touch Move/Pinch/Zoom gesture
  handlePinchZoom(ev);
}
```

### Trình xử lý touchend

Trình xử lý {{domxref("Element/touchend_event", "touchend")}} khôi phục màu nền của phần tử mục tiêu sự kiện về màu gốc của nó.

```js
function endHandler(ev) {
  ev.preventDefault();
  if (logEvents) log(ev.type, ev, false);
  if (ev.targetTouches.length === 0) {
    // Restore background and border to original values
    ev.target.style.background = "white";
    ev.target.style.border = "1px solid black";
  }
}
```

### Giao diện người dùng ứng dụng

Ứng dụng sử dụng các phần tử {{HTMLElement("div")}} cho các vùng chạm và cung cấp các nút để bật ghi nhật ký và xóa nhật ký.

```html
<div id="target1">Tap, Hold or Swipe me 1</div>
<div id="target2">Tap, Hold or Swipe me 2</div>
<div id="target3">Tap, Hold or Swipe me 3</div>
<div id="target4">Tap, Hold or Swipe me 4</div>

<!-- UI for logging/debugging -->
<button id="toggle-log">Start/Stop event logging</button>
<button id="clear-log">Clear the log</button>
<output id="output"></output>
```

### Các hàm phụ

Các hàm này hỗ trợ ứng dụng nhưng không trực tiếp tham gia vào luồng sự kiện.

#### Cập nhật màu nền

Màu nền của các vùng chạm sẽ thay đổi như sau: không chạm là `white`; một lần chạm là `yellow`; hai lần chạm đồng thời là `pink`, và ba hoặc nhiều hơn lần chạm đồng thời là `lightblue`. Xem [trình xử lý touchmove](#trình_xử_lý_touchmove) để biết thông tin về màu nền thay đổi khi phát hiện di chuyển/kẹp/zoom 2 ngón tay.

```js
function updateBackground(ev) {
  // Change background color based on the number simultaneous touches
  // in the event's targetTouches list:
  //   yellow - one tap (or hold)
  //   pink - two taps
  //   lightblue - more than two taps
  switch (ev.targetTouches.length) {
    case 1:
      // Single tap`
      ev.target.style.background = "yellow";
      break;
    case 2:
      // Two simultaneous touches
      ev.target.style.background = "pink";
      break;
    default:
      // More than two simultaneous touches
      ev.target.style.background = "lightblue";
  }
}
```

#### Ghi nhật ký sự kiện

Các hàm được sử dụng để ghi nhật ký hoạt động sự kiện vào cửa sổ ứng dụng, để hỗ trợ gỡ lỗi và học về luồng sự kiện.

```js
const output = document.getElementById("output");

function toggleLog(ev) {
  logEvents = !logEvents;
}

document.getElementById("toggle-log").addEventListener("click", toggleLog);

function log(name, ev, printTargetIds) {
  let s =
    `${name}: touches = ${ev.touches.length} ; ` +
    `targetTouches = ${ev.targetTouches.length} ; ` +
    `changedTouches = ${ev.changedTouches.length}`;
  output.innerText += `${s}\n`;

  if (printTargetIds) {
    s = "";
    for (const touch of ev.targetTouches) {
      s += `... id = ${touch.identifier}\n`;
    }
    output.innerText += s;
  }
}

function clearLog(event) {
  output.textContent = "";
}

document.getElementById("clear-log").addEventListener("click", clearLog);
```

## Xem thêm

- [Pointer events](/en-US/docs/Web/API/Pointer_events)
