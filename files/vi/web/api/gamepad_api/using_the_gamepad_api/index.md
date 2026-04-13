---
title: Using the Gamepad API
slug: Web/API/Gamepad_API/Using_the_Gamepad_API
page-type: guide
browser-compat: api.Gamepad
---

{{DefaultAPISidebar("Gamepad API")}}

HTML cung cấp các thành phần cần thiết cho việc phát triển trò chơi tương tác phong phú. Những công nghệ như `<canvas>`, WebGL, `<audio>` và `<video>`, cùng với các triển khai JavaScript, hỗ trợ những tác vụ mang lại các tính năng tương tự, nếu không muốn nói là giống hệt, với mã gốc. Gamepad API cho phép nhà phát triển và nhà thiết kế truy cập và sử dụng gamepad cùng các bộ điều khiển trò chơi khác.

[Gamepad API](/en-US/docs/Web/API/Gamepad_API) giới thiệu các sự kiện mới trên đối tượng {{ domxref("Window") }} để đọc trạng thái của gamepad và bộ điều khiển (sau đây gọi chung là _gamepad_). Bên cạnh các sự kiện này, API cũng bổ sung một đối tượng {{ domxref("Gamepad") }}, mà bạn có thể dùng để truy vấn trạng thái của một gamepad đã kết nối, cùng với phương thức {{ domxref("navigator.getGamepads()") }}, mà bạn có thể dùng để lấy danh sách các gamepad mà trang biết đến.

## Kết nối với một gamepad

Khi một gamepad mới được kết nối với máy tính, trang đang được focus sẽ đầu tiên nhận một sự kiện {{ domxref("Window/gamepadconnected_event", "gamepadconnected") }}. Nếu gamepad đã được kết nối sẵn khi trang tải xong, sự kiện {{ domxref("Window/gamepadconnected_event", "gamepadconnected") }} sẽ được gửi đến trang đang được focus khi người dùng nhấn một nút hoặc di chuyển một trục.

> [!NOTE]
> Trong Firefox, gamepad chỉ được hiển thị cho một trang khi người dùng tương tác với nó trong lúc trang đang hiển thị. Điều này giúp ngăn gamepad bị dùng để [fingerprinting](/en-US/docs/Glossary/Fingerprinting) người dùng. Khi một gamepad đã được tương tác, các gamepad đã kết nối khác sẽ tự động hiển thị.

Bạn có thể dùng {{domxref("Window/gamepadconnected_event", "gamepadconnected")}} như sau:

```js
window.addEventListener("gamepadconnected", (e) => {
  console.log(
    "Gamepad connected at index %d: %s. %d buttons, %d axes.",
    e.gamepad.index,
    e.gamepad.id,
    e.gamepad.buttons.length,
    e.gamepad.axes.length,
  );
});
```

Mỗi gamepad có một ID duy nhất đi kèm, và ID này có trong thuộc tính {{domxref("GamepadEvent.gamepad", "gamepad")}} của sự kiện.

## Ngắt kết nối gamepad

Khi một gamepad bị ngắt kết nối, và nếu trang trước đó đã nhận dữ liệu cho gamepad đó (ví dụ: {{ domxref("Window/gamepadconnected_event", "gamepadconnected") }}), một sự kiện thứ hai sẽ được gửi tới cửa sổ đang được focus, {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}}:

```js
window.addEventListener("gamepaddisconnected", (e) => {
  console.log(
    "Gamepad disconnected from index %d: %s",
    e.gamepad.index,
    e.gamepad.id,
  );
});
```

Thuộc tính {{domxref("Gamepad.index", "index")}} của gamepad sẽ là duy nhất cho từng thiết bị được kết nối với hệ thống, ngay cả khi có nhiều bộ điều khiển cùng loại. Thuộc tính `index` cũng hoạt động như chỉ số trong {{jsxref("Array")}} được trả về bởi {{ domxref("Navigator.getGamepads()") }}.

```js
const gamepads = {};

function gamepadHandler(event, connected) {
  const gamepad = event.gamepad;
  // Note:
  // gamepad === navigator.getGamepads()[gamepad.index]

  if (connected) {
    gamepads[gamepad.index] = gamepad;
  } else {
    delete gamepads[gamepad.index];
  }
}

window.addEventListener("gamepadconnected", (e) => {
  gamepadHandler(e, true);
});
window.addEventListener("gamepaddisconnected", (e) => {
  gamepadHandler(e, false);
});
```

Ví dụ trước đó cũng cho thấy cách thuộc tính `gamepad` có thể được giữ lại sau khi sự kiện kết thúc - một kỹ thuật mà chúng ta sẽ dùng cho việc truy vấn trạng thái thiết bị ở phần sau.

## Truy vấn đối tượng Gamepad

Như bạn thấy, các sự kiện **gamepad** nói trên bao gồm thuộc tính `gamepad` trên đối tượng sự kiện, thuộc tính này trả về một đối tượng {{ domxref("Gamepad") }}. Chúng ta có thể dùng nó để xác định gamepad nào (tức là ID của nó) đã gây ra sự kiện, vì nhiều gamepad có thể được kết nối cùng lúc. Chúng ta còn có thể làm nhiều hơn với đối tượng {{ domxref("Gamepad") }}, bao gồm giữ tham chiếu đến nó và truy vấn nó để biết những nút bấm và trục nào đang được nhấn tại bất kỳ thời điểm nào. Điều này thường hữu ích cho trò chơi hoặc các trang web tương tác khác cần biết trạng thái hiện tại của gamepad thay vì đợi đến lần sự kiện tiếp theo.

Các phép kiểm tra như vậy thường được thực hiện bằng cách dùng đối tượng {{ domxref("Gamepad") }} kết hợp với một vòng lặp hoạt ảnh (ví dụ: {{ domxref("Window.requestAnimationFrame","requestAnimationFrame") }}), khi nhà phát triển muốn đưa ra quyết định cho khung hình hiện tại dựa trên trạng thái của một hoặc nhiều gamepad.

Phương thức {{domxref("Navigator.getGamepads()")}} trả về một mảng tất cả thiết bị hiện đang hiển thị với trang web, dưới dạng các đối tượng {{ domxref("Gamepad") }} (giá trị đầu tiên luôn là `null`, nên `null` sẽ được trả về nếu không có gamepad nào được kết nối). Từ đó, bạn có thể dùng để lấy cùng thông tin. Ví dụ, đoạn mã đầu tiên ở trên có thể được viết lại như sau:

```js
window.addEventListener("gamepadconnected", (e) => {
  const gp = navigator.getGamepads()[e.gamepad.index];
  console.log(
    "Gamepad connected at index %d: %s. %d buttons, %d axes.",
    gp.index,
    gp.id,
    gp.buttons.length,
    gp.axes.length,
  );
});
```

Các thuộc tính của đối tượng {{ domxref("Gamepad") }} như sau:

- `id`: Một chuỗi chứa một số thông tin về bộ điều khiển. Chuỗi này không được đặc tả chặt chẽ, nhưng trong Firefox nó sẽ chứa ba phần thông tin được ngăn cách bằng dấu gạch ngang (`-`): hai chuỗi thập lục phân 4 chữ số chứa USB vendor ID và product ID của bộ điều khiển, và tên của bộ điều khiển do trình điều khiển cung cấp. Thông tin này nhằm giúp bạn tìm ra cách ánh xạ cho các điều khiển trên thiết bị cũng như hiển thị phản hồi hữu ích cho người dùng.
- `index`: Một số nguyên duy nhất cho mỗi gamepad hiện đang được kết nối với hệ thống. Thuộc tính này có thể dùng để phân biệt nhiều bộ điều khiển. Lưu ý rằng việc ngắt kết nối một thiết bị rồi kết nối thiết bị mới có thể tái sử dụng chỉ số trước đó.
- `mapping`: Một chuỗi cho biết trình duyệt có ánh xạ lại các điều khiển trên thiết bị theo một bố cục đã biết hay không. Hiện tại chỉ có một bố cục đã biết được hỗ trợ - [standard gamepad](https://w3c.github.io/gamepad/gamepad.html#remapping). Nếu trình duyệt có thể ánh xạ các điều khiển của thiết bị theo bố cục đó, thuộc tính `mapping` sẽ có giá trị chuỗi `standard`.
- `connected`: Một giá trị boolean cho biết gamepad còn đang được kết nối với hệ thống hay không. Nếu còn, giá trị là `true`; nếu không, giá trị là `false`.
- `buttons`: Một mảng các đối tượng {{ domxref("GamepadButton") }} biểu diễn các nút bấm có trên thiết bị. Mỗi {{ domxref("GamepadButton") }} có thuộc tính `pressed` và `value`:
  - Thuộc tính `pressed` là một giá trị boolean cho biết nút hiện đang được nhấn (`true`) hay chưa nhấn (`false`).
  - Thuộc tính `value` là một giá trị số thực dùng để biểu diễn các nút analog, chẳng hạn như cò trên nhiều gamepad hiện đại. Các giá trị được chuẩn hóa trong phạm vi 0.0..1.0, trong đó 0.0 biểu thị nút chưa được nhấn, còn 1.0 biểu thị nút được nhấn hết cỡ.

- `axes`: Một mảng biểu diễn các điều khiển có trục trên thiết bị (ví dụ: cần analog). Mỗi mục trong mảng là một giá trị số thực trong phạm vi -1.0 - 1.0, biểu diễn vị trí trục từ giá trị thấp nhất (-1.0) đến giá trị cao nhất (1.0).
- `timestamp`: Thuộc tính này trả về một {{ domxref("DOMHighResTimeStamp") }} biểu thị thời điểm gần nhất dữ liệu của gamepad này được cập nhật, cho phép nhà phát triển xác định liệu dữ liệu `axes` và `button` có được cập nhật từ phần cứng hay chưa. Giá trị phải tương đối so với thuộc tính `navigationStart` của giao diện {{ domxref("PerformanceTiming") }}. Các giá trị tăng dần theo thứ tự thời gian, nghĩa là có thể so sánh để xác định thứ tự cập nhật, vì giá trị mới hơn sẽ luôn lớn hơn hoặc bằng giá trị cũ hơn. Lưu ý rằng thuộc tính này hiện không được Firefox hỗ trợ.

> [!NOTE]
> Đối tượng Gamepad có sẵn trên sự kiện {{ domxref("Window/gamepadconnected_event", "gamepadconnected") }} thay vì trên chính đối tượng {{ domxref("Window") }}, vì lý do bảo mật. Khi đã có tham chiếu đến nó, chúng ta có thể truy vấn các thuộc tính của nó để lấy thông tin về trạng thái hiện tại của gamepad. Ẩn bên dưới, đối tượng này sẽ được cập nhật mỗi khi trạng thái của gamepad thay đổi.

### Sử dụng thông tin nút bấm

Hãy xem một ví dụ hiển thị thông tin kết nối cho một gamepad (nó bỏ qua các kết nối gamepad tiếp theo) và cho phép bạn di chuyển một quả bóng quanh màn hình bằng bốn nút gamepad ở bên phải của bộ điều khiển. Bạn có thể [xem bản demo trực tiếp](https://chrisdavidmills.github.io/gamepad-buttons/), và [tìm mã nguồn](https://github.com/chrisdavidmills/gamepad-buttons/tree/master) trên GitHub.

Trước tiên, chúng ta khai báo một số biến: đoạn `gamepadInfo` chứa thông tin kết nối, `ball` là quả bóng muốn di chuyển, biến `start` đóng vai trò ID cho `requestAnimationFrame`, các biến `a` và `b` dùng làm hệ số dịch chuyển khi di chuyển bóng, và các biến viết tắt sẽ được dùng cho các nhánh tương thích trình duyệt của {{ domxref("Window.requestAnimationFrame", "requestAnimationFrame()") }} và {{ domxref("Window.cancelAnimationFrame", "cancelAnimationFrame()") }}.

```js
const gamepadInfo = document.getElementById("gamepad-info");
const ball = document.getElementById("ball");
let start;
let a = 0;
let b = 0;
```

Tiếp theo, chúng ta dùng sự kiện {{domxref("Window/gamepadconnected_event", "gamepadconnected")}} để kiểm tra xem có gamepad được kết nối hay không. Khi một gamepad được kết nối, chúng ta lấy gamepad bằng {{ domxref("Navigator.getGamepads()", "navigator.getGamepads()[0]") }}, in thông tin về gamepad vào `div` thông tin gamepad của chúng ta, và gọi hàm `gameLoop()` để khởi động toàn bộ quá trình di chuyển bóng.

```js
window.addEventListener("gamepadconnected", (e) => {
  const gp = navigator.getGamepads()[e.gamepad.index];
  gamepadInfo.textContent = `Gamepad connected at index ${gp.index}: ${gp.id}. It has ${gp.buttons.length} buttons and ${gp.axes.length} axes.`;

  gameLoop();
});
```

Bây giờ chúng ta dùng sự kiện {{domxref("Window/gamepaddisconnected_event", "gamepaddisconnected")}} để kiểm tra xem gamepad có bị ngắt kết nối trở lại hay không. Nếu có, chúng ta dừng vòng lặp {{DOMxRef("Window.requestAnimationFrame", "requestAnimationFrame()")}} (xem bên dưới) và đưa thông tin gamepad trở về trạng thái ban đầu.

```js
window.addEventListener("gamepaddisconnected", (e) => {
  gamepadInfo.textContent = "Waiting for gamepad.";

  cancelAnimationFrame(start);
});
```

Bây giờ đến vòng lặp game chính. Trong mỗi lần chạy của vòng lặp, chúng ta kiểm tra xem một trong bốn nút có đang được nhấn hay không; nếu có, chúng ta cập nhật các giá trị của biến di chuyển `a` và `b` cho phù hợp, rồi cập nhật các thuộc tính {{ cssxref("left") }} và {{ cssxref("top") }}, thay đổi giá trị của chúng thành các giá trị hiện tại của `a` và `b`. Điều này tạo ra hiệu ứng di chuyển bóng trên màn hình.

Khi tất cả việc đó đã xong, chúng ta dùng `requestAnimationFrame()` để yêu cầu khung hình tiếp theo, chạy lại `gameLoop()`.

```js
function gameLoop() {
  const gamepads = navigator.getGamepads();
  if (!gamepads) {
    return;
  }

  const gp = gamepads[0];
  if (gp.buttons[0].pressed) {
    b--;
  }
  if (gp.buttons[2].pressed) {
    b++;
  }
  if (gp.buttons[1].pressed) {
    a++;
  }
  if (gp.buttons[3].pressed) {
    a--;
  }

  ball.style.left = `${a * 2}px`;
  ball.style.top = `${b * 2}px`;

  start = requestAnimationFrame(gameLoop);
}
```

## Ví dụ hoàn chỉnh: Hiển thị trạng thái gamepad

Ví dụ này cho thấy cách sử dụng đối tượng {{domxref("Gamepad")}}, cũng như các sự kiện {{domxref("Window/gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window/gamepaddisconnected_event", "gamepaddisconnected")}} để hiển thị trạng thái của tất cả gamepad được kết nối với hệ thống. Ví dụ này dựa trên một [bản demo Gamepad](https://luser.github.io/gamepadtest/), với [mã nguồn có sẵn trên GitHub](https://github.com/luser/gamepadtest).

```js
let loopStarted = false;

window.addEventListener("gamepadconnected", (evt) => {
  addGamepad(evt.gamepad);
});
window.addEventListener("gamepaddisconnected", (evt) => {
  removeGamepad(evt.gamepad);
});

function addGamepad(gamepad) {
  const d = document.createElement("div");
  d.setAttribute("id", `controller${gamepad.index}`);

  const t = document.createElement("h1");
  t.textContent = `gamepad: ${gamepad.id}`;
  d.append(t);

  const b = document.createElement("ul");
  b.className = "buttons";
  gamepad.buttons.forEach((button, i) => {
    const e = document.createElement("li");
    e.className = "button";
    e.textContent = `Button ${i}`;
    b.append(e);
  });

  d.append(b);

  const a = document.createElement("div");
  a.className = "axes";

  gamepad.axes.forEach((axis, i) => {
    const p = document.createElement("progress");
    p.className = "axis";
    p.setAttribute("max", "2");
    p.setAttribute("value", "1");
    p.textContent = i;
    a.append(p);
  });

  d.appendChild(a);

  // See https://github.com/luser/gamepadtest/blob/master/index.html
  const start = document.querySelector("#start");
  if (start) {
    start.style.display = "none";
  }

  document.body.append(d);
  if (!loopStarted) {
    requestAnimationFrame(updateStatus);
    loopStarted = true;
  }
}

function removeGamepad(gamepad) {
  document.querySelector(`#controller${gamepad.index}`).remove();
}

function updateStatus() {
  for (const gamepad of navigator.getGamepads()) {
    if (!gamepad) continue;

    const d = document.getElementById(`controller${gamepad.index}`);
    const buttonElements = d.getElementsByClassName("button");

    for (const [i, button] of gamepad.buttons.entries()) {
      const el = buttonElements[i];

      const pct = `${Math.round(button.value * 100)}%`;
      el.style.backgroundSize = `${pct} ${pct}`;
      if (button.pressed) {
        el.textContent = `Button ${i} [PRESSED]`;
        el.style.color = "#42f593";
        el.className = "button pressed";
      } else {
        el.textContent = `Button ${i}`;
        el.style.color = "#2e2d33";
        el.className = "button";
      }
    }

    const axisElements = d.getElementsByClassName("axis");
    for (const [i, axis] of gamepad.axes.entries()) {
      const el = axisElements[i];
      el.textContent = `${i}: ${axis.toFixed(4)}`;
      el.setAttribute("value", axis + 1);
    }
  }

  requestAnimationFrame(updateStatus);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
