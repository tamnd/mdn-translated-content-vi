---
title: "KeyboardEvent: thuộc tính code"
short-title: code
slug: Web/API/KeyboardEvent/code
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.code
---

{{APIRef("UI Events")}}

Thuộc tính `KeyboardEvent.code` biểu diễn một phím vật lý trên bàn phím (trái ngược với ký tự được tạo ra khi nhấn phím). Nói cách khác, thuộc tính này trả về một giá trị không bị thay đổi bởi bố cục bàn phím hoặc trạng thái của các phím bổ trợ.

Nếu thiết bị nhập liệu không phải là bàn phím vật lý, mà là bàn phím ảo hoặc thiết bị hỗ trợ tiếp cận, giá trị trả về sẽ được trình duyệt đặt để khớp gần nhất có thể với những gì sẽ xảy ra với bàn phím vật lý, nhằm tối đa hóa khả năng tương thích giữa thiết bị nhập liệu vật lý và ảo.

Thuộc tính này hữu ích khi bạn muốn xử lý các phím dựa trên vị trí vật lý của chúng trên thiết bị nhập liệu thay vì các ký tự được liên kết với những phím đó; điều này đặc biệt phổ biến khi viết mã để xử lý đầu vào cho các trò chơi mô tả môi trường gamepad bằng các phím trên bàn phím. Tuy nhiên, hãy lưu ý rằng bạn không thể sử dụng giá trị được báo cáo bởi `KeyboardEvent.code` để xác định ký tự được tạo ra bởi phím nhấn, vì tên mã phím có thể không khớp với ký tự thực tế được in trên phím hoặc được máy tính tạo ra khi phím được nhấn.

Ví dụ: `code` trả về là `"KeyQ"` cho phím <kbd>Q</kbd> trên bàn phím có bố cục QWERTY, nhưng cùng giá trị `code` này cũng biểu diễn phím <kbd>'</kbd> trên bàn phím Dvorak và phím <kbd>A</kbd> trên bàn phím AZERTY. Điều này khiến không thể sử dụng giá trị của `code` để xác định tên của phím đối với người dùng nếu họ không sử dụng bố cục bàn phím dự kiến.

Để xác định ký tự nào tương ứng với sự kiện phím, hãy sử dụng thuộc tính {{domxref("KeyboardEvent.key")}} thay thế.

## Giá trị

Các giá trị code cho Windows, Linux và macOS được liệt kê trên trang [KeyboardEvent: giá trị code](/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values).

## Ví dụ

### Thực hành KeyboardEvent

#### HTML

```html
<p>
  Nhấn các phím trên bàn phím để xem giá trị key và code của KeyboardEvent
  là gì cho từng phím.
</p>
<div id="output" tabindex="0"></div>
```

#### CSS

```css
#output {
  font-family: "Helvetica", "Arial", sans-serif;
  border: 1px solid black;
  width: 95%;
  margin: auto;
}
#output:focus-visible {
  outline: 3px solid dodgerblue;
}
```

#### JavaScript

```js
window.addEventListener("keydown", (event) => {
  const p = document.createElement("p");
  p.textContent = `KeyboardEvent: key='${event.key}' | code='${event.code}'`;
  document.getElementById("output").appendChild(p);
  window.scrollTo(0, document.body.scrollHeight);
});
```

#### Thử nghiệm

Để đảm bảo các phím nhấn được gửi đến mẫu, hãy nhấp hoặc tập trung vào hộp kết quả bên dưới trước khi nhấn phím.

{{ EmbedLiveSample('Exercising_KeyboardEvent', 600, 300) }}

### Xử lý sự kiện bàn phím trong trò chơi

Ví dụ này thiết lập một trình lắng nghe sự kiện cho các sự kiện {{domxref("Element/keydown_event", "keydown")}} để xử lý đầu vào bàn phím cho một trò chơi sử dụng bố cục bàn phím "WASD" điển hình để di chuyển về phía trước, sang trái, lùi lại và sang phải. Điều này sẽ sử dụng cùng bốn phím vật lý bất kể ký tự tương ứng thực tế là gì, chẳng hạn như nếu người dùng đang sử dụng bàn phím AZERTY.

#### HTML

```html
<p>Sử dụng các phím WASD (ZQSD trên AZERTY) để di chuyển và lái.</p>
<svg
  xmlns="http://www.w3.org/2000/svg"
  version="1.1"
  class="world"
  tabindex="0">
  <polygon id="spaceship" points="15,0 0,30 30,30" />
</svg>
```

#### CSS

```css
.world {
  margin: 0px;
  padding: 0px;
  background-color: black;
  width: 400px;
  height: 400px;
}
.world:focus-visible {
  outline: 5px solid dodgerblue;
}
#spaceship {
  fill: orange;
  stroke: red;
  stroke-width: 2px;
}
```

#### JavaScript

Phần đầu tiên của mã JavaScript thiết lập một số biến chúng ta sẽ sử dụng. `shipSize` chứa kích thước của tàu mà người chơi đang di chuyển, để thuận tiện. `position` được sử dụng để theo dõi vị trí của tàu trong khu vực chơi. `moveRate` là số pixel mỗi lần nhấn phím di chuyển tàu về phía trước và lùi lại, và `turnRate` là số độ xoay mà các điều khiển lái trái và phải áp dụng cho mỗi lần nhấn phím. `angle` là lượng xoay hiện tại được áp dụng cho tàu tính bằng độ; nó bắt đầu từ 0° (hướng thẳng lên trên). Cuối cùng, `spaceship` được đặt để tham chiếu đến phần tử có ID `"spaceship"`, là đa giác SVG biểu diễn tàu mà người chơi điều khiển.

```js
let shipSize = {
  width: 30,
  height: 30,
};

let position = {
  x: 200,
  y: 200,
};

let moveRate = 9;
let turnRate = 5;

let angle = 0;

let spaceship = document.getElementById("spaceship");
```

Tiếp theo là hàm `updatePosition()`. Hàm này nhận đầu vào là khoảng cách tàu sẽ di chuyển, trong đó dương là di chuyển về phía trước và âm là di chuyển lùi lại. Hàm này tính toán vị trí mới của tàu dựa trên khoảng cách di chuyển và hướng hiện tại của tàu. Nó cũng xử lý việc đảm bảo tàu vượt qua các ranh giới của khu vực chơi thay vì biến mất.

```js
function updatePosition(offset) {
  let rad = angle * (Math.PI / 180);
  position.x += Math.sin(rad) * offset;
  position.y -= Math.cos(rad) * offset;

  if (position.x < 0) {
    position.x = 399;
  } else if (position.x > 399) {
    position.x = 0;
  }

  if (position.y < 0) {
    position.y = 399;
  } else if (position.y > 399) {
    position.y = 0;
  }
}
```

Hàm `refresh()` xử lý việc áp dụng phép xoay và vị trí bằng cách sử dụng [phép biến đổi SVG](/en-US/docs/Web/SVG/Reference/Attribute/transform).

```js
function refresh() {
  let x = position.x - shipSize.width / 2;
  let y = position.y - shipSize.height / 2;
  let transform = `translate(${x} ${y}) rotate(${angle} 15 15) `;

  spaceship.setAttribute("transform", transform);
}
refresh();
```

Cuối cùng, phương thức `addEventListener()` được sử dụng để bắt đầu lắng nghe các sự kiện {{domxref("Element/keydown_event", "keydown")}}, thực hiện hành động cho mỗi phím bằng cách cập nhật vị trí và góc xoay của tàu, sau đó gọi `refresh()` để vẽ tàu ở vị trí và góc mới.

```js
window.addEventListener("keydown", (event) => {
  if (event.defaultPrevented) {
    return; // Không làm gì nếu sự kiện đã được xử lý
  }

  switch (event.code) {
    case "KeyS":
    case "ArrowDown":
      // Xử lý "lùi lại"
      updatePosition(-moveRate);
      break;
    case "KeyW":
    case "ArrowUp":
      // Xử lý "tiến lên"
      updatePosition(moveRate);
      break;
    case "KeyA":
    case "ArrowLeft":
      // Xử lý "rẽ trái"
      angle -= turnRate;
      break;
    case "KeyD":
    case "ArrowRight":
      // Xử lý "rẽ phải"
      angle += turnRate;
      break;
  }

  refresh();

  if (event.code !== "Tab") {
    // Tiêu thụ sự kiện để nó không được xử lý hai lần,
    // miễn là người dùng không cố di chuyển tiêu điểm đi chỗ khác
    event.preventDefault();
  }
});
```

#### Thử nghiệm

Để đảm bảo các phím nhấn được gửi đến mã mẫu, hãy nhấp hoặc tập trung vào khu vực chơi màu đen bên dưới trước khi nhấn phím.

{{EmbedLiveSample("Handle_keyboard_events_in_a_game", 420, 460)}}

Có một số cách để cải thiện mã này. Hầu hết các trò chơi thực sẽ theo dõi các sự kiện {{domxref("Element/keydown_event", "keydown")}}, bắt đầu chuyển động khi điều đó xảy ra và dừng chuyển động khi {{domxref("Element/keyup_event", "keyup")}} tương ứng xảy ra, thay vì dựa vào việc lặp lại phím. Điều đó sẽ cho phép chuyển động mượt mà và nhanh hơn, đồng thời cho phép người chơi di chuyển và lái cùng lúc. Có thể sử dụng các transition hoặc animation để làm cho chuyển động của tàu mượt mà hơn.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
