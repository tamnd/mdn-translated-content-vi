---
title: "Thử thách: Thêm tính năng vào demo bóng nảy của chúng ta"
short-title: "Thử thách: Tính năng bóng nảy"
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Adding_bouncing_balls_features
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Trong thử thách này, bạn được yêu cầu sử dụng demo bóng nảy từ bài viết trước làm điểm xuất phát, và thêm một số tính năng mới và thú vị vào đó.

## Điểm xuất phát

Để bắt đầu thử thách này, hãy tạo bản sao local của [index-finished.html](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/index-finished.html), [style.css](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/style.css) và [main-finished.js](https://github.com/mdn/learning-area/blob/main/javascript/oojs/bouncing-balls/main-finished.js) từ bài viết trước của chúng ta trong một thư mục mới trên máy tính của bạn.

Ngoài ra, bạn có thể sử dụng trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).
Nếu trình soạn thảo trực tuyến bạn đang sử dụng không có panel JavaScript riêng, bạn có thể đặt nó inline trong phần tử `<script>` bên trong trang HTML.

> [!NOTE]
> Nếu bạn bị kẹt, bạn có thể liên hệ với chúng tôi trong một trong các [kênh truyền thông của chúng tôi](/en-US/docs/MDN/Community/Communication_channels).

## Gợi ý và mẹo

Một vài lưu ý trước khi bạn bắt đầu.

- Thử thách này khá khó. Hãy đọc tất cả hướng dẫn trước khi bạn bắt đầu lập trình, và thực hiện từng bước chậm rãi và cẩn thận.
- Đó có thể là ý tưởng tốt để lưu một bản sao riêng của demo sau khi bạn làm cho mỗi giai đoạn hoạt động, để bạn có thể tham khảo lại nó nếu sau này gặp rắc rối.

## Tóm tắt dự án

Demo bóng nảy của chúng ta rất vui, nhưng bây giờ chúng ta muốn làm cho nó tương tác hơn một chút bằng cách thêm một vòng tròn xấu xa được điều khiển bởi người dùng, sẽ ăn các quả bóng nếu bắt được chúng. Chúng ta cũng muốn kiểm tra kỹ năng xây dựng đối tượng của bạn bằng cách tạo một đối tượng `Shape()` chung mà các quả bóng và vòng tròn xấu xa của chúng ta có thể kế thừa. Cuối cùng, chúng ta muốn thêm bộ đếm điểm để theo dõi số lượng quả bóng còn lại cần bắt.

Ảnh chụp màn hình sau cung cấp cho bạn ý tưởng về chương trình đã hoàn chỉnh sẽ trông như thế nào:

![Ảnh chụp màn hình trang demo bóng nảy. Một vòng tròn có viền trắng được thấy thêm vào các quả bóng đầy màu sắc, và văn bản "Ball count: 23" hiển thị bên dưới tiêu đề.](bouncing-evil-circle.png)

Để cho bạn biết thêm về điều đó, hãy xem [ví dụ đã hoàn chỉnh](https://mdn.github.io/learning-area/javascript/oojs/assessment/) (đừng nhìn vào source code!)

## Các bước cần hoàn thành

Các phần sau mô tả những gì bạn cần làm.

### Tạo lớp Shape

Trước hết, tạo một lớp `Shape` mới. Lớp này chỉ có một hàm khởi tạo. Hàm khởi tạo `Shape` phải định nghĩa các thuộc tính `x`, `y`, `velX` và `velY` theo cách tương tự như hàm khởi tạo `Ball()` đã làm ban đầu, nhưng không có các thuộc tính `color` và `size`.

Lớp `Ball` phải được tạo để kế thừa từ `Shape` bằng cách sử dụng `extends`. Hàm khởi tạo cho `Ball` phải:

- nhận các đối số giống như trước: `x`, `y`, `velX`, `velY`, `size` và `color`
- gọi hàm khởi tạo `Shape` bằng cách sử dụng `super()`, truyền các đối số `x`, `y`, `velX` và `velY`
- khởi tạo các thuộc tính `color` và `size` của riêng nó từ các tham số được cung cấp.

> [!NOTE]
> Đảm bảo tạo lớp `Shape` phía trên lớp `Ball` hiện có, nếu không bạn sẽ gặp lỗi như: "Uncaught ReferenceError: Cannot access 'Shape' before initialization"

Hàm khởi tạo `Ball` phải định nghĩa một thuộc tính mới được gọi là `exists`, được sử dụng để theo dõi xem các quả bóng có tồn tại trong chương trình không (chưa bị vòng tròn xấu xa ăn). Đây phải là boolean (`true`/`false`), được khởi tạo là `true` trong hàm khởi tạo.

Phương thức `collisionDetect()` của lớp `Ball` cần cập nhật nhỏ. Một quả bóng cần được xem xét để phát hiện va chạm chỉ khi thuộc tính `exists` là `true`. Vì vậy, hãy thay thế code `collisionDetect()` hiện có bằng code sau:

```js
class Ball {
  // …
  collisionDetect() {
    for (const ball of balls) {
      if (!(this === ball) && ball.exists) {
        const dx = this.x - ball.x;
        const dy = this.y - ball.y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < this.size + ball.size) {
          ball.color = this.color = randomRGB();
        }
      }
    }
  }
  // …
}
```

Như đã thảo luận ở trên, bổ sung duy nhất là kiểm tra xem quả bóng có tồn tại không — bằng cách sử dụng `ball.exists` trong điều kiện `if`.

Các định nghĩa phương thức `draw()` và `update()` của quả bóng phải có thể giữ nguyên như trước.

Tại thời điểm này, hãy thử tải lại code — nó phải hoạt động giống như trước, với các đối tượng được thiết kế lại của chúng ta.

### Định nghĩa EvilCircle

Bây giờ đến lúc gặp kẻ xấu — `EvilCircle()`! Trò chơi của chúng ta chỉ liên quan đến một vòng tròn xấu xa, nhưng chúng ta vẫn sẽ định nghĩa nó bằng cách sử dụng hàm khởi tạo kế thừa từ `Shape()`, để cho bạn thực hành. Bạn có thể muốn thêm một vòng tròn khác vào ứng dụng sau này có thể được điều khiển bởi người chơi khác, hoặc có một số vòng tròn xấu xa do máy tính điều khiển. Bạn có thể không thể chiếm lĩnh thế giới với một vòng tròn xấu xa duy nhất, nhưng nó sẽ ổn cho thử thách này.

Tạo định nghĩa cho lớp `EvilCircle`. Nó phải kế thừa từ `Shape` bằng cách sử dụng `extends`.

#### Hàm khởi tạo EvilCircle

Hàm khởi tạo cho `EvilCircle` phải:

- được truyền chỉ các đối số `x`, `y`
- truyền các đối số `x`, `y` lên lớp cha `Shape` cùng với các giá trị cho `velX` và `velY` được mã hóa cứng thành 20. Bạn nên thực hiện điều này với code như `super(x, y, 20, 20);`
- đặt `color` thành `white` và `size` thành `10`.

Cuối cùng, hàm khởi tạo phải thiết lập code cho phép người dùng di chuyển vòng tròn xấu xa trên màn hình:

```js
window.addEventListener("keydown", (e) => {
  switch (e.key) {
    case "a":
      this.x -= this.velX;
      break;
    case "d":
      this.x += this.velX;
      break;
    case "w":
      this.y -= this.velY;
      break;
    case "s":
      this.y += this.velY;
      break;
  }
});
```

Điều này thêm trình xử lý sự kiện `keydown` vào đối tượng `window` để khi một phím được nhấn, thuộc tính [`key`](/en-US/docs/Web/API/KeyboardEvent/key) của đối tượng sự kiện được tham khảo để xem phím nào đang được nhấn. Nếu đó là một trong bốn phím được chỉ định, thì vòng tròn xấu xa sẽ di chuyển trái/phải/lên/xuống.

### Định nghĩa phương thức cho EvilCircle

Lớp `EvilCircle` phải có ba phương thức, như mô tả bên dưới.

#### draw()

Phương thức này có cùng mục đích với phương thức `draw()` cho `Ball`: nó vẽ thực thể đối tượng lên canvas. Phương thức `draw()` cho `EvilCircle` sẽ hoạt động theo cách rất tương tự, vì vậy bạn có thể bắt đầu bằng cách sao chép phương thức `draw()` cho `Ball`. Sau đó bạn phải thực hiện các thay đổi sau:

- Chúng ta muốn vòng tròn xấu xa không được tô đầy, mà chỉ có đường viền ngoài (stroke). Bạn có thể đạt được điều này bằng cách cập nhật [`fillStyle`](/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle) và [`fill()`](/en-US/docs/Web/API/CanvasRenderingContext2D/fill) thành [`strokeStyle`](/en-US/docs/Web/API/CanvasRenderingContext2D/strokeStyle) và [`stroke()`](/en-US/docs/Web/API/CanvasRenderingContext2D/stroke) tương ứng.
- Chúng ta cũng muốn làm cho stroke dày hơn một chút, để bạn có thể thấy vòng tròn xấu xa dễ dàng hơn. Điều này có thể đạt được bằng cách đặt giá trị cho [`lineWidth`](/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth) ở đâu đó sau lời gọi [`beginPath()`](/en-US/docs/Web/API/CanvasRenderingContext2D/beginPath) (3 sẽ ổn).

#### checkBounds()

Phương thức này sẽ làm điều tương tự như phần đầu tiên của phương thức `update()` cho `Ball` — xem xét liệu vòng tròn xấu xa có sắp đi ra ngoài cạnh màn hình không, và ngăn không cho nó làm vậy. Một lần nữa, bạn có thể hầu như chỉ sao chép phương thức `update()` cho `Ball`, nhưng có một vài thay đổi bạn nên thực hiện:

- Loại bỏ hai dòng cuối — chúng ta không muốn tự động cập nhật vị trí của vòng tròn xấu xa trên mỗi khung, vì chúng ta sẽ di chuyển nó theo cách khác, như bạn sẽ thấy bên dưới.
- Bên trong các câu lệnh `if ()`, nếu các kiểm tra trả về true chúng ta không muốn cập nhật `velX`/`velY`; thay vào đó chúng ta muốn thay đổi giá trị của `x`/`y` để vòng tròn xấu xa nảy lại vào màn hình một chút. Thêm hoặc trừ (tùy trường hợp) thuộc tính `size` của vòng tròn xấu xa sẽ hợp lý.

#### collisionDetect()

Phương thức này sẽ hoạt động theo cách rất tương tự với phương thức `collisionDetect()` cho `Ball`, vì vậy bạn có thể sử dụng bản sao đó làm cơ sở cho phương thức mới này. Nhưng có một vài điểm khác biệt:

- Trong câu lệnh `if` bên ngoài, bạn không còn cần kiểm tra xem quả bóng hiện tại trong lần lặp có giống với quả bóng đang thực hiện kiểm tra không — vì nó không còn là quả bóng nữa, đó là vòng tròn xấu xa! Thay vào đó, bạn cần kiểm tra xem quả bóng đang được kiểm tra có tồn tại không (bạn có thể làm điều này với thuộc tính nào?). Nếu không tồn tại, nó đã bị vòng tròn xấu xa ăn, vì vậy không cần kiểm tra lại.
- Trong câu lệnh `if` bên trong, bạn không còn muốn làm cho các đối tượng đổi màu khi phát hiện va chạm — thay vào đó, bạn muốn đặt bất kỳ quả bóng nào va chạm với vòng tròn xấu xa thành không tồn tại nữa (một lần nữa, bạn nghĩ làm điều đó như thế nào?).

### Đưa vòng tròn xấu xa vào chương trình

Bây giờ chúng ta đã định nghĩa vòng tròn xấu xa, chúng ta cần thực sự làm cho nó xuất hiện trong cảnh của chúng ta. Để làm điều này, bạn cần thực hiện một số thay đổi đối với hàm `loop()`.

- Trước hết, tạo một thực thể đối tượng vòng tròn xấu xa mới (chỉ định các tham số cần thiết). Bạn chỉ cần làm điều này một lần, không phải trên mỗi lần lặp của vòng lặp.
- Tại điểm bạn lặp qua mọi quả bóng và gọi các hàm `draw()`, `update()` và `collisionDetect()` cho mỗi quả bóng, hãy làm cho các hàm này chỉ được gọi nếu quả bóng hiện tại tồn tại.
- Gọi các phương thức `draw()`, `checkBounds()` và `collisionDetect()` của thực thể vòng tròn xấu xa trên mỗi lần lặp của vòng lặp.

### Triển khai bộ đếm điểm

Để triển khai bộ đếm điểm, hãy làm theo các bước sau:

1. Trong tệp HTML của bạn, thêm phần tử {{HTMLElement("p")}} ngay bên dưới phần tử {{HTMLElement("Heading_Elements", "h1")}} có chứa văn bản "Ball count: ".
2. Trong tệp CSS của bạn, thêm quy tắc sau vào cuối:

   ```css
   p {
     position: absolute;
     margin: 0;
     top: 35px;
     right: 5px;
     color: #aaaaaa;
   }
   ```

3. Trong JavaScript của bạn, thực hiện các cập nhật sau:
   - Tạo một biến lưu trữ tham chiếu đến đoạn văn.
   - Đếm số lượng quả bóng trên màn hình theo cách nào đó.
   - Tăng bộ đếm và hiển thị số quả bóng được cập nhật mỗi lần quả bóng được thêm vào cảnh.
   - Giảm bộ đếm và hiển thị số quả bóng được cập nhật mỗi khi vòng tròn xấu xa ăn một quả bóng (làm cho nó không tồn tại).

{{PreviousMenu("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
