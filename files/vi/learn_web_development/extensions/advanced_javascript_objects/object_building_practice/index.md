---
title: Thực hành xây dựng đối tượng
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Test_your_skills/Object-oriented_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Adding_bouncing_balls_features", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Trong các bài viết trước, chúng ta đã xem xét tất cả lý thuyết đối tượng JavaScript thiết yếu và chi tiết cú pháp, cho bạn nền tảng vững chắc để bắt đầu. Trong bài viết này, chúng ta sẽ thực hành, cho bạn thêm kinh nghiệm xây dựng các đối tượng JavaScript tùy chỉnh, với kết quả vui vẻ và đầy màu sắc.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các kiến thức cơ bản về JavaScript
        (đặc biệt là
        <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">Kiến thức cơ bản về đối tượng</a>) và các khái niệm JavaScript hướng đối tượng được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        Thực hành sử dụng đối tượng và kỹ thuật hướng đối tượng
        trong ngữ cảnh thực tế.
      </td>
    </tr>
  </tbody>
</table>

## Hãy tạo một số bóng nảy

Trong bài viết này, chúng ta sẽ viết một demo "bóng nảy" cổ điển, để cho bạn thấy các đối tượng có thể hữu ích như thế nào trong JavaScript. Những quả bóng nhỏ của chúng ta sẽ nảy trên màn hình và đổi màu khi chúng chạm nhau. Ví dụ đã hoàn chỉnh sẽ trông như thế này:

![Ảnh chụp màn hình trang web có tiêu đề "Bouncing balls". 23 quả bóng với các màu pastel và kích thước khác nhau hiển thị trên nền đen với những vệt dài phía sau chúng cho thấy chuyển động.](bouncing-balls.png)

Ví dụ này sẽ sử dụng [Canvas API](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics) để vẽ các quả bóng lên màn hình, và [`requestAnimationFrame`](/en-US/docs/Web/API/Window/requestAnimationFrame) API để tạo hoạt ảnh cho toàn bộ màn hình — bạn không cần có kiến thức trước về các API này, và chúng tôi hy vọng rằng khi bạn hoàn thành bài viết này, bạn sẽ quan tâm đến việc khám phá chúng nhiều hơn. Trong quá trình đó, chúng ta sẽ sử dụng một số đối tượng nhanh nhẹn, và cho bạn xem một vài kỹ thuật hay như bóng nảy khỏi tường, và kiểm tra xem chúng có va chạm với nhau không (còn được gọi là _phát hiện va chạm_).

## Bắt đầu

Để bắt đầu, hãy tạo bản sao local của các tệp [`index.html`](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/index.html), [`style.css`](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/style.css) và [`main.js`](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/main.js) của chúng ta. Chúng chứa những điều sau, tương ứng:

1. Một tài liệu HTML rất đơn giản có phần tử {{HTMLElement("Heading_Elements", "h1")}}, phần tử {{HTMLElement("canvas")}} để vẽ các quả bóng, và các phần tử để áp dụng CSS và JavaScript vào HTML của chúng ta.
2. Một số kiểu rất đơn giản, chủ yếu phục vụ để tạo kiểu và định vị `<h1>`, và loại bỏ bất kỳ thanh cuộn hoặc lề nào xung quanh cạnh trang (để trông đẹp và gọn gàng).
3. Một số JavaScript phục vụ để thiết lập phần tử `<canvas>` và cung cấp một hàm tổng quát mà chúng ta sẽ sử dụng.

Phần đầu tiên của script trông như sau:

```js
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

const width = (canvas.width = window.innerWidth);
const height = (canvas.height = window.innerHeight);
```

Script này lấy tham chiếu đến phần tử `<canvas>`, sau đó gọi phương thức [`getContext()`](/en-US/docs/Web/API/HTMLCanvasElement/getContext) trên nó để cung cấp cho chúng ta một ngữ cảnh mà chúng ta có thể bắt đầu vẽ. Hằng số kết quả (`ctx`) là đối tượng đại diện trực tiếp cho vùng vẽ của canvas và cho phép chúng ta vẽ các hình 2D trên đó.

Tiếp theo, chúng ta thiết lập các hằng số có tên `width` và `height`, và chiều rộng và chiều cao của phần tử canvas (được biểu diễn bởi các thuộc tính `canvas.width` và `canvas.height`) bằng với chiều rộng và chiều cao của viewport trình duyệt (khu vực mà trang web xuất hiện — có thể lấy từ các thuộc tính {{domxref("Window.innerWidth")}} và {{domxref("Window.innerHeight")}}).

Lưu ý rằng chúng ta đang xâu chuỗi nhiều phép gán cùng nhau, để đặt tất cả biến nhanh hơn — điều này hoàn toàn ổn.

Sau đó chúng ta có hai hàm helper:

```js
function random(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomRGB() {
  return `rgb(${random(0, 255)} ${random(0, 255)} ${random(0, 255)})`;
}
```

Hàm `random()` nhận hai số làm đối số và trả về một số ngẫu nhiên trong khoảng giữa hai số đó. Hàm `randomRGB()` tạo một màu ngẫu nhiên được biểu diễn dưới dạng chuỗi {{cssxref("color_value/rgb")}}.

## Mô hình hóa một quả bóng trong chương trình của chúng ta

Chương trình của chúng ta sẽ có nhiều quả bóng nảy trên màn hình. Vì những quả bóng này đều hoạt động theo cùng một cách, nên có lý khi đại diện chúng bằng một đối tượng. Hãy bắt đầu bằng cách thêm định nghĩa lớp sau vào cuối code của chúng ta.

```js
class Ball {
  constructor(x, y, velX, velY, color, size) {
    this.x = x;
    this.y = y;
    this.velX = velX;
    this.velY = velY;
    this.color = color;
    this.size = size;
  }
}
```

Cho đến nay, lớp này chỉ chứa một hàm khởi tạo, trong đó chúng ta có thể khởi tạo các thuộc tính mà mỗi quả bóng cần để hoạt động trong chương trình của chúng ta:

- tọa độ `x` và `y` — tọa độ ngang và dọc nơi quả bóng bắt đầu trên màn hình. Điều này có thể dao động từ 0 (góc trên bên trái) đến chiều rộng và chiều cao của viewport trình duyệt (góc dưới bên phải).
- vận tốc ngang và dọc (`velX` và `velY`) — mỗi quả bóng được cấp vận tốc ngang và dọc; theo thực tế, các giá trị này được thêm thường xuyên vào các giá trị tọa độ `x`/`y` khi chúng ta tạo hoạt ảnh cho các quả bóng, để di chuyển chúng đi một lượng này ở mỗi khung hình.
- `color` — mỗi quả bóng được tô màu.
- `size` — mỗi quả bóng có kích thước — đây là bán kính của nó, tính bằng pixel.

Điều này xử lý các thuộc tính, nhưng còn các phương thức thì sao? Chúng ta muốn làm cho các quả bóng của mình thực sự làm điều gì đó trong chương trình.

### Vẽ quả bóng

Đầu tiên, thêm phương thức `draw()` sau vào lớp `Ball`:

```js
class Ball {
  // …
  draw() {
    ctx.beginPath();
    ctx.fillStyle = this.color;
    ctx.arc(this.x, this.y, this.size, 0, 2 * Math.PI);
    ctx.fill();
  }
}
```

Sử dụng hàm này, chúng ta có thể bảo quả bóng tự vẽ lên màn hình, bằng cách gọi một loạt thành viên của ngữ cảnh canvas 2D mà chúng ta đã định nghĩa trước đó (`ctx`). Ngữ cảnh giống như tờ giấy, và bây giờ chúng ta muốn ra lệnh cho bút của mình vẽ gì đó lên đó:

- Đầu tiên, chúng ta sử dụng [`beginPath()`](/en-US/docs/Web/API/CanvasRenderingContext2D/beginPath) để nói rằng chúng ta muốn vẽ một hình trên giấy.
- Tiếp theo, chúng ta sử dụng [`fillStyle`](/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle) để định nghĩa màu chúng ta muốn hình có — chúng ta đặt nó theo thuộc tính `color` của quả bóng.
- Tiếp theo, chúng ta sử dụng phương thức [`arc()`](/en-US/docs/Web/API/CanvasRenderingContext2D/arc) để vẽ hình cung trên giấy. Các tham số của nó là:
  - Vị trí `x` và `y` của tâm cung — chúng ta đang chỉ định các thuộc tính `x` và `y` của quả bóng.
  - Bán kính của cung — trong trường hợp này, thuộc tính `size` của quả bóng.
  - Hai tham số cuối chỉ định số độ bắt đầu và kết thúc xung quanh đường tròn mà cung được vẽ giữa. Ở đây chúng ta chỉ định 0 độ và `2 * PI`, là tương đương với 360 độ theo radian (thật phiền phức, bạn phải chỉ định điều này theo radian). Điều đó cho chúng ta một hình tròn hoàn chỉnh. Nếu bạn chỉ định `1 * PI`, bạn sẽ có một nửa vòng tròn (180 độ).

- Cuối cùng, chúng ta sử dụng phương thức [`fill()`](/en-US/docs/Web/API/CanvasRenderingContext2D/fill), về cơ bản là nói "kết thúc vẽ đường dẫn chúng ta đã bắt đầu với `beginPath()`, và tô màu cho vùng mà nó chiếm bằng màu chúng ta đã chỉ định trước đó trong `fillStyle`."

Bạn có thể bắt đầu kiểm tra đối tượng của mình rồi.

1. Lưu code cho đến nay và tải tệp HTML vào trình duyệt.
2. Mở bảng điều khiển JavaScript của trình duyệt, sau đó làm mới trang để kích thước canvas thay đổi thành viewport hiển thị nhỏ hơn còn lại khi bảng điều khiển mở.
3. Nhập phần sau để tạo thực thể quả bóng mới:

   ```js
   const testBall = new Ball(50, 100, 4, 4, "blue", 10);
   ```

4. Hãy thử gọi các thành viên của nó:

   ```js
   testBall.x;
   testBall.size;
   testBall.color;
   testBall.draw();
   ```

5. Khi bạn nhập dòng cuối cùng, bạn sẽ thấy quả bóng tự vẽ ở đâu đó trên canvas.

### Cập nhật dữ liệu của quả bóng

Chúng ta có thể vẽ quả bóng ở vị trí, nhưng để thực sự di chuyển quả bóng, chúng ta cần một hàm cập nhật nào đó. Thêm code sau vào bên trong định nghĩa lớp cho `Ball`:

```js
class Ball {
  // …
  update() {
    if (this.x + this.size >= width) {
      this.velX = -this.velX;
    }

    if (this.x - this.size <= 0) {
      this.velX = -this.velX;
    }

    if (this.y + this.size >= height) {
      this.velY = -this.velY;
    }

    if (this.y - this.size <= 0) {
      this.velY = -this.velY;
    }

    this.x += this.velX;
    this.y += this.velY;
  }
}
```

Bốn phần đầu tiên của hàm kiểm tra xem quả bóng có chạm tới cạnh canvas không. Nếu có, chúng ta đảo chiều cực của vận tốc liên quan để làm cho quả bóng đi theo hướng ngược lại. Vì vậy ví dụ, nếu quả bóng đang di chuyển lên (âm `velY`), thì vận tốc dọc được thay đổi để nó bắt đầu đi xuống thay thế (dương `velY`).

Trong bốn trường hợp, chúng ta đang kiểm tra để xem:

- nếu tọa độ `x` lớn hơn chiều rộng của canvas (quả bóng đang đi ra ngoài cạnh phải).
- nếu tọa độ `x` nhỏ hơn 0 (quả bóng đang đi ra ngoài cạnh trái).
- nếu tọa độ `y` lớn hơn chiều cao của canvas (quả bóng đang đi ra ngoài cạnh dưới).
- nếu tọa độ `y` nhỏ hơn 0 (quả bóng đang đi ra ngoài cạnh trên).

Trong mỗi trường hợp, chúng ta bao gồm `size` của quả bóng trong tính toán vì tọa độ `x`/`y` nằm ở tâm quả bóng, nhưng chúng ta muốn cạnh của quả bóng nảy khỏi chu vi — chúng ta không muốn quả bóng đi nửa đường ra ngoài màn hình trước khi bắt đầu nảy trở lại.

Hai dòng cuối thêm giá trị `velX` vào tọa độ `x`, và giá trị `velY` vào tọa độ `y` — quả bóng thực sự được di chuyển mỗi lần phương thức này được gọi.

Tạm thời thế là đủ; hãy tiếp tục với một số hoạt ảnh!

## Tạo hoạt ảnh cho quả bóng

Bây giờ hãy làm cho nó thú vị. Bây giờ chúng ta sẽ bắt đầu thêm các quả bóng vào canvas và tạo hoạt ảnh cho chúng.

Đầu tiên, chúng ta cần tạo nơi để lưu trữ tất cả các quả bóng của mình và sau đó điền vào đó. Phần sau sẽ làm điều này — thêm nó vào cuối code của bạn ngay bây giờ:

```js
const balls = [];

while (balls.length < 25) {
  const size = random(10, 20);
  const ball = new Ball(
    // ball position always drawn at least one ball width
    // away from the edge of the canvas, to avoid drawing errors
    random(0 + size, width - size),
    random(0 + size, height - size),
    random(-7, 7),
    random(-7, 7),
    randomRGB(),
    size,
  );

  balls.push(ball);
}
```

Vòng lặp `while` tạo một thực thể mới của `Ball()` bằng cách sử dụng các giá trị ngẫu nhiên được tạo bởi các hàm `random()` và `randomRGB()`, sau đó `push()` nó vào cuối mảng balls, nhưng chỉ trong khi số lượng quả bóng trong mảng nhỏ hơn 25. Vì vậy khi chúng ta có 25 quả bóng trong mảng, không có thêm quả bóng nào được đẩy vào nữa. Bạn có thể thử thay đổi số trong `balls.length < 25` để có nhiều hoặc ít quả bóng hơn trong mảng. Tùy thuộc vào sức mạnh xử lý mà máy tính/trình duyệt của bạn có, chỉ định vài nghìn quả bóng có thể làm chậm hoạt ảnh khá nhiều!

Tiếp theo, thêm phần sau vào cuối code của bạn:

```js
function loop() {
  ctx.fillStyle = "rgb(0 0 0 / 25%)";
  ctx.fillRect(0, 0, width, height);

  for (const ball of balls) {
    ball.draw();
    ball.update();
  }

  requestAnimationFrame(loop);
}
```

Tất cả các chương trình tạo hoạt ảnh thường liên quan đến một vòng lặp hoạt ảnh, phục vụ để cập nhật thông tin trong chương trình và sau đó hiển thị kết quả trên mỗi khung hình của hoạt ảnh; đây là cơ sở cho hầu hết các trò chơi và các chương trình tương tự. Hàm `loop()` của chúng ta làm như sau:

- Đặt màu tô của canvas thành màu đen bán trong suốt, sau đó vẽ một hình chữ nhật với màu đó trên toàn bộ chiều rộng và chiều cao của canvas, sử dụng `fillRect()` (bốn tham số cung cấp tọa độ bắt đầu, và chiều rộng và chiều cao cho hình chữ nhật được vẽ). Điều này phục vụ để che đi bản vẽ của khung trước đó trước khi khung tiếp theo được vẽ. Nếu bạn không làm điều này, bạn sẽ thấy những con rắn dài uốn khúc trên canvas thay vì các quả bóng chuyển động! Màu của tô được đặt thành bán trong suốt, `rgb(0 0 0 / 25%)`, để cho phép một vài khung trước đó lộ ra một chút, tạo ra những vệt nhỏ phía sau các quả bóng khi chúng di chuyển. Nếu bạn đổi 0.25 thành 1, bạn sẽ không thấy chúng nữa. Hãy thử thay đổi số này để xem nó có tác dụng gì.
- Lặp qua tất cả các quả bóng trong mảng `balls`, và chạy hàm `draw()` và `update()` của mỗi quả bóng để vẽ mỗi quả lên màn hình, sau đó thực hiện các cập nhật cần thiết về vị trí và vận tốc để sẵn sàng cho khung tiếp theo.
- Chạy hàm lại bằng phương thức `requestAnimationFrame()` — khi phương thức này được chạy liên tục và được truyền cùng tên hàm, nó chạy hàm đó một số lần nhất định mỗi giây để tạo hoạt ảnh mượt mà. Điều này thường được thực hiện đệ quy — có nghĩa là hàm đang tự gọi mình mỗi lần chạy, vì vậy nó chạy đi chạy lại mãi.

Cuối cùng, thêm dòng sau vào cuối code của bạn — chúng ta cần gọi hàm một lần để bắt đầu hoạt ảnh.

```js
loop();
```

Đó là tất cả cho phần cơ bản — hãy thử lưu và làm mới để kiểm tra các quả bóng nảy của bạn!

## Thêm phát hiện va chạm

Bây giờ cho một chút vui vẻ, hãy thêm phát hiện va chạm vào chương trình của chúng ta, để các quả bóng biết khi chúng đã chạm vào quả bóng khác.

Đầu tiên, thêm định nghĩa phương thức sau vào lớp `Ball` của bạn.

```js
class Ball {
  // …
  collisionDetect() {
    for (const ball of balls) {
      if (this !== ball) {
        const dx = this.x - ball.x;
        const dy = this.y - ball.y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < this.size + ball.size) {
          ball.color = this.color = randomRGB();
        }
      }
    }
  }
}
```

Phương thức này hơi phức tạp, vì vậy đừng lo lắng nếu bạn không hiểu chính xác cách nó hoạt động ngay bây giờ. Giải thích như sau:

- Với mỗi quả bóng, chúng ta cần kiểm tra mọi quả bóng khác để xem nó có va chạm với quả bóng hiện tại không. Để làm điều này, chúng ta bắt đầu một vòng lặp `for...of` khác để lặp qua tất cả các quả bóng trong mảng `balls[]`.
- Ngay trong vòng lặp for, chúng ta sử dụng câu lệnh `if` để kiểm tra xem quả bóng hiện tại đang được lặp qua có giống với quả bóng mà chúng ta đang kiểm tra không. Chúng ta không muốn kiểm tra xem quả bóng có va chạm với chính nó không! Để làm điều này, chúng ta kiểm tra xem quả bóng hiện tại (tức là quả bóng có phương thức collisionDetect đang được gọi) có giống với quả bóng vòng lặp không (tức là quả bóng đang được tham chiếu bởi lần lặp hiện tại của vòng lặp for trong phương thức collisionDetect). Sau đó chúng ta sử dụng `!` để phủ định kiểm tra, vì vậy code bên trong câu lệnh `if` chỉ chạy nếu chúng **không** giống nhau.
- Sau đó chúng ta sử dụng một thuật toán phổ biến để kiểm tra va chạm của hai đường tròn. Về cơ bản chúng ta đang kiểm tra xem có diện tích nào của hai đường tròn chồng lên nhau không. Điều này được giải thích thêm trong [phát hiện va chạm 2D](/en-US/docs/Games/Techniques/2D_collision_detection).
- Nếu phát hiện va chạm, code bên trong câu lệnh `if` bên trong được chạy. Trong trường hợp này, chúng ta chỉ đặt thuộc tính `color` của cả hai đường tròn thành một màu ngẫu nhiên mới. Chúng ta có thể đã làm điều gì đó phức tạp hơn, như làm cho các quả bóng nảy ra khỏi nhau một cách thực tế, nhưng điều đó sẽ phức tạp hơn nhiều để triển khai. Đối với các mô phỏng vật lý như vậy, các nhà phát triển có xu hướng sử dụng thư viện trò chơi hoặc vật lý như [PhysicsJS](https://wellcaffeinated.net/PhysicsJS/), [matter.js](https://brm.io/matter-js/), [Phaser](https://phaser.io/), v.v.

Bạn cũng cần gọi phương thức này trong mỗi khung của hoạt ảnh. Cập nhật hàm `loop()` của bạn để gọi `ball.collisionDetect()` sau `ball.update()`:

```js
function loop() {
  ctx.fillStyle = "rgb(0 0 0 / 25%)";
  ctx.fillRect(0, 0, width, height);

  for (const ball of balls) {
    ball.draw();
    ball.update();
    ball.collisionDetect();
  }

  requestAnimationFrame(loop);
}
```

Lưu và làm mới demo lại, và bạn sẽ thấy các quả bóng đổi màu khi chúng va chạm!

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm cho ví dụ này hoạt động, hãy thử so sánh code JavaScript của bạn với [phiên bản hoàn chỉnh](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/main-finished.js) của chúng ta (cũng xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/oojs/bouncing-balls/index-finished.html)).

## Tóm tắt

Chúng tôi hy vọng bạn đã vui khi viết ví dụ bóng nảy ngẫu nhiên thực tế của riêng mình, sử dụng các kỹ thuật đối tượng và hướng đối tượng khác nhau từ khắp mô-đun! Điều này phải cho bạn thực hành hữu ích trong việc sử dụng đối tượng, và ngữ cảnh thực tế tốt.

Đó là tất cả cho các bài học về đối tượng — tất cả những gì còn lại bây giờ là bạn kiểm tra kỹ năng của mình trong thử thách mô-đun.

## Xem thêm

- [Hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial) — hướng dẫn canvas 2D cho người mới bắt đầu.
- [requestAnimationFrame()](/en-US/docs/Web/API/Window/requestAnimationFrame)
- [Phát hiện va chạm 2D](/en-US/docs/Games/Techniques/2D_collision_detection)
- [Phát hiện va chạm 3D](/en-US/docs/Games/Techniques/3D_collision_detection)
- [Trò chơi phá gạch 2D sử dụng JavaScript thuần túy](/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript) — một hướng dẫn tuyệt vời cho người mới bắt đầu để xây dựng một trò chơi 2D.
- [Trò chơi phá gạch 2D sử dụng Phaser](/en-US/docs/Games/Tutorials/2D_breakout_game_Phaser) — giải thích các cơ bản về xây dựng trò chơi 2D bằng thư viện trò chơi JavaScript.

{{PreviousMenuNext("Learn_web_development/Extensions/Advanced_JavaScript_objects/Test_your_skills/Object-oriented_JavaScript", "Learn_web_development/Extensions/Advanced_JavaScript_objects/Adding_bouncing_balls_features", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
