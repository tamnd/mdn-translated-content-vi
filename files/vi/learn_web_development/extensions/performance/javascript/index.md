---
title: Tối ưu hóa hiệu suất JavaScript
short-title: JavaScript có hiệu suất cao
slug: Learn_web_development/Extensions/Performance/JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/video", "Learn_web_development/Extensions/Performance/HTML", "Learn_web_development/Extensions/Performance")}}

Rất quan trọng khi xem xét cách bạn đang sử dụng JavaScript trên các trang web của mình và suy nghĩ về cách giảm thiểu bất kỳ vấn đề hiệu suất nào mà nó có thể gây ra. Trong khi hình ảnh và video chiếm hơn 70% lượng byte được tải xuống cho trang web trung bình, theo từng byte, JavaScript có tiềm năng tác động tiêu cực đến hiệu suất lớn hơn — nó có thể ảnh hưởng đáng kể đến thời gian tải xuống, hiệu suất kết xuất, và mức sử dụng CPU và pin. Bài viết này giới thiệu các mẹo và kỹ thuật để tối ưu hóa JavaScript nhằm nâng cao hiệu suất của trang web.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu về ảnh hưởng của JavaScript đến hiệu suất web và cách giảm thiểu hoặc khắc phục các vấn đề liên quan.
      </td>
    </tr>
  </tbody>
</table>

## Tối ưu hóa hay không tối ưu hóa

Câu hỏi đầu tiên bạn nên trả lời trước khi bắt đầu tối ưu hóa mã của mình là "tôi cần tối ưu hóa điều gì?". Một số mẹo và kỹ thuật được thảo luận dưới đây là các phương pháp hay nhất sẽ mang lại lợi ích cho hầu hết mọi dự án web, trong khi một số chỉ cần thiết trong các tình huống nhất định. Cố gắng áp dụng tất cả các kỹ thuật này ở mọi nơi có thể là không cần thiết và có thể là lãng phí thời gian của bạn. Bạn nên tìm ra những tối ưu hóa hiệu suất nào thực sự cần thiết trong mỗi dự án.

Để làm điều này, bạn cần [đo lường hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance) của trang web. Như liên kết trước cho thấy, có nhiều cách khác nhau để đo lường hiệu suất, một số liên quan đến [các API hiệu suất](/en-US/docs/Web/API/Performance_API) phức tạp. Cách tốt nhất để bắt đầu, tuy nhiên, là tìm hiểu cách sử dụng các công cụ như các công cụ [mạng](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#network_monitor_tools) và [hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#performance_monitor_tools) tích hợp trong trình duyệt, để xem các phần tải trang nào đang mất nhiều thời gian và cần tối ưu hóa.

## Tối ưu hóa tải xuống JavaScript

JavaScript hiệu suất cao nhất, ít chặn nhất mà bạn có thể sử dụng là JavaScript mà bạn hoàn toàn không sử dụng. Bạn nên sử dụng ít JavaScript nhất có thể. Một số mẹo cần ghi nhớ:

- **Bạn không phải lúc nào cũng cần một framework**: Bạn có thể quen thuộc với việc sử dụng [JavaScript framework](/en-US/docs/Learn_web_development/Core/Frameworks_libraries). Nếu bạn có kinh nghiệm và tự tin khi sử dụng framework này, và thích tất cả các công cụ mà nó cung cấp, thì nó có thể là công cụ ưu tiên của bạn để xây dựng hầu hết các dự án. Tuy nhiên, các framework nặng JavaScript. Nếu bạn đang tạo trải nghiệm khá tĩnh với ít yêu cầu JavaScript, bạn có thể không cần framework đó. Bạn có thể thực hiện những gì bạn cần bằng một vài dòng JavaScript tiêu chuẩn.
- **Xem xét giải pháp đơn giản hơn**: Bạn có thể có một giải pháp bóng bẩy, thú vị để triển khai, nhưng hãy xem xét liệu người dùng của bạn có đánh giá cao nó không. Họ có muốn thứ gì đó đơn giản hơn không?
- **Loại bỏ mã không sử dụng:** Điều này có vẻ hiển nhiên, nhưng thật ngạc nhiên khi có bao nhiêu nhà phát triển quên dọn sạch chức năng không sử dụng được thêm vào trong quá trình phát triển. Bạn cần cẩn thận và có chủ ý về những gì được thêm vào và loại bỏ. Tất cả tập lệnh đều được phân tích, dù có được sử dụng hay không; vì vậy, một cách nhanh chóng để tăng tốc độ tải xuống là loại bỏ bất kỳ chức năng nào không được sử dụng. Hãy xem xét rằng thường bạn chỉ sử dụng một phần nhỏ chức năng có sẵn trong framework. Có thể tạo một bản dựng tùy chỉnh của framework chỉ chứa phần bạn cần không?
- **Xem xét các tính năng tích hợp của trình duyệt**: Có thể bạn có thể sử dụng tính năng mà trình duyệt đã có, thay vì tạo của riêng mình qua JavaScript. Ví dụ:
  - Sử dụng [xác thực biểu mẫu phía client tích hợp](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation#using_built-in_form_validation).
  - Sử dụng trình phát {{htmlelement("video")}} của trình duyệt.
  - Sử dụng [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) thay vì thư viện hoạt ảnh JavaScript (xem thêm [Xử lý hoạt ảnh](#handling_javascript_animations)).

Bạn cũng nên chia JavaScript của mình thành nhiều tệp đại diện cho các phần quan trọng và không quan trọng. [Các mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules) cho phép bạn làm điều này hiệu quả hơn so với chỉ sử dụng các tệp JavaScript bên ngoài riêng biệt.

Sau đó bạn có thể tối ưu hóa các tệp nhỏ hơn này. {{Glossary("Minification")}} giảm số lượng ký tự trong tệp của bạn, do đó giảm số byte hoặc trọng lượng của JavaScript. {{Glossary("Gzip compression", "Gzip")}} nén tệp thêm và nên được sử dụng ngay cả khi bạn không thu nhỏ mã của mình. {{Glossary("Brotli compression", "Brotli")}} tương tự như Gzip, nhưng thường vượt trội hơn nén Gzip.

Bạn có thể chia và tối ưu hóa mã của mình theo cách thủ công, nhưng thường một trình đóng gói mô-đun như [webpack](https://webpack.js.org/) sẽ làm tốt hơn điều này.

## Xử lý phân tích và thực thi

Trước khi xem xét các mẹo trong phần này, điều quan trọng cần nói về _vị trí_ trong quá trình kết xuất trang trình duyệt mà JavaScript được xử lý. Khi một trang web được tải:

1. HTML thường được phân tích trước, theo thứ tự xuất hiện trên trang.
2. Bất cứ khi nào CSS được gặp, nó được phân tích để hiểu các kiểu cần được áp dụng cho trang. Trong thời gian này, các tài nguyên được liên kết như hình ảnh và phông chữ web bắt đầu được tải xuống.
3. Bất cứ khi nào JavaScript được gặp, trình duyệt phân tích, đánh giá và chạy nó trên trang.
4. Một chút sau, trình duyệt tính toán cách mỗi phần tử HTML nên được tạo kiểu, dựa trên CSS được áp dụng cho nó.
5. Kết quả được tạo kiểu sau đó được vẽ lên màn hình.

> [!NOTE]
> Đây là một mô tả rất đơn giản hóa về những gì xảy ra, nhưng nó cho bạn ý tưởng.

Bước quan trọng ở đây là Bước 3. Theo mặc định, phân tích và thực thi JavaScript là chặn kết xuất. Điều này có nghĩa là trình duyệt chặn phân tích bất kỳ HTML nào xuất hiện sau JavaScript được gặp, cho đến khi tập lệnh được xử lý. Kết quả là, tạo kiểu và vẽ cũng bị chặn. Điều này có nghĩa là bạn cần suy nghĩ cẩn thận không chỉ về những gì bạn đang tải xuống, mà còn về thời điểm và cách mã đó đang được thực thi.

Các phần tiếp theo cung cấp các kỹ thuật hữu ích để tối ưu hóa việc phân tích và thực thi JavaScript.

## Tải các tài nguyên quan trọng càng sớm càng tốt

Nếu một tập lệnh thực sự quan trọng và bạn lo ngại rằng nó đang ảnh hưởng đến hiệu suất do không được tải đủ nhanh, bạn có thể tải nó bên trong {{htmlelement("head")}} của tài liệu:

```html
<head>
  ...
  <script src="main.js"></script>
  ...
</head>
```

Điều này hoạt động ổn, nhưng là chặn kết xuất. Một chiến lược tốt hơn là sử dụng [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) để tạo preloader cho JavaScript quan trọng:

```html
<head>
  ...
  <!-- Preload a JavaScript file -->
  <link rel="preload" href="important-js.js" as="script" />
  <!-- Preload a JavaScript module -->
  <link rel="modulepreload" href="important-module.js" />
  ...
</head>
```

Thẻ preload {{htmlelement("link")}} tải JavaScript càng sớm càng tốt, mà không chặn kết xuất. Bạn có thể sử dụng nó bất cứ đâu bạn muốn trong trang của mình:

```html
<!-- Include this wherever makes sense -->
<script src="important-js.js"></script>
```

hoặc bên trong tập lệnh của bạn, trong trường hợp là mô-đun JavaScript:

```js
import { someFunction } from "important-module.js";
```

> [!NOTE]
> Preloading không đảm bảo rằng tập lệnh sẽ được tải vào lúc bạn bao gồm nó, nhưng nó có nghĩa là nó sẽ bắt đầu được tải xuống sớm hơn. Thời gian chặn kết xuất vẫn sẽ được rút ngắn, ngay cả khi không được loại bỏ hoàn toàn.

## Hoãn thực thi JavaScript không quan trọng

Mặt khác, bạn nên cố gắng hoãn phân tích và thực thi JavaScript không quan trọng đến sau, khi cần thiết. Tải tất cả lên phía trước chặn kết xuất một cách không cần thiết.

Trước hết, bạn có thể thêm thuộc tính `async` vào các phần tử `<script>` của mình:

```html
<head>
  ...
  <script async src="main.js"></script>
  ...
</head>
```

Điều này khiến tập lệnh được tải xuống song song với phân tích DOM, vì vậy nó sẽ sẵn sàng cùng lúc và sẽ không chặn kết xuất.

> [!NOTE]
> Có một thuộc tính khác, `defer`, khiến tập lệnh được thực thi sau khi tài liệu đã được phân tích, nhưng trước khi kích hoạt sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}. Điều này có tác dụng tương tự như `async`.

Bạn cũng có thể không tải JavaScript cho đến khi một sự kiện xảy ra khi cần thiết. Điều này có thể được thực hiện thông qua DOM scripting, ví dụ:

```js
const scriptElem = document.createElement("script");
scriptElem.src = "index.js";
scriptElem.addEventListener("load", () => {
  // Run a function contained within index.js once it has definitely loaded
  init();
});
document.head.append(scriptElem);
```

Các mô-đun JavaScript có thể được tải động bằng hàm {{jsxref("operators/import", "import()")}}:

```js
import("./modules/myModule.js").then((module) => {
  // Do something with the module
});
```

## Chia nhỏ các tác vụ dài

Khi trình duyệt chạy JavaScript của bạn, nó sẽ tổ chức tập lệnh thành các tác vụ chạy tuần tự, chẳng hạn như thực hiện các yêu cầu tải xuống, xử lý tương tác người dùng và đầu vào thông qua các trình xử lý sự kiện, chạy hoạt ảnh được điều khiển bởi JavaScript, v.v.

Hầu hết điều này xảy ra trên luồng chính, với các ngoại lệ bao gồm JavaScript chạy trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers). Luồng chính chỉ có thể chạy một tác vụ tại một thời điểm.

Khi một tác vụ đơn lẻ mất hơn 50 ms để chạy, nó được phân loại là tác vụ dài. Nếu người dùng cố gắng tương tác với trang hoặc một cập nhật giao diện người dùng quan trọng được yêu cầu trong khi một tác vụ dài đang chạy, trải nghiệm của họ sẽ bị ảnh hưởng. Phản hồi mong đợi hoặc cập nhật hình ảnh sẽ bị trì hoãn, dẫn đến giao diện người dùng trông chậm chạp hoặc không phản hồi.

Để giảm thiểu vấn đề này, bạn cần chia nhỏ các tác vụ dài thành các tác vụ nhỏ hơn. Điều này cho trình duyệt nhiều cơ hội hơn để thực hiện xử lý tương tác người dùng quan trọng hoặc cập nhật kết xuất giao diện người dùng — trình duyệt có thể thực hiện chúng giữa mỗi tác vụ nhỏ hơn, thay vì chỉ trước hoặc sau tác vụ dài. Trong JavaScript của bạn, bạn có thể làm điều này bằng cách chia mã của bạn thành các hàm riêng biệt. Điều này cũng có ý nghĩa vì nhiều lý do khác, chẳng hạn như bảo trì dễ dàng hơn, gỡ lỗi và viết bài kiểm tra.

Ví dụ:

```js
function main() {
  a();
  b();
  c();
  d();
  e();
}
```

Tuy nhiên, loại cấu trúc này không giúp ích gì với việc chặn luồng chính. Vì tất cả năm hàm đang chạy bên trong một hàm main, trình duyệt chạy tất cả chúng như một tác vụ dài duy nhất.

Để xử lý điều này, chúng ta có xu hướng chạy hàm "nhường" định kỳ để làm cho mã _nhường cho luồng chính_. Điều này có nghĩa là mã của chúng ta được chia thành nhiều tác vụ, giữa việc thực thi mà trình duyệt được cung cấp cơ hội để xử lý các tác vụ có mức độ ưu tiên cao như cập nhật giao diện người dùng. Một mẫu phổ biến cho hàm này sử dụng {{domxref("Window.setTimeout", "setTimeout()")}} để trì hoãn thực thi thành một tác vụ riêng biệt:

```js
function yieldFunc() {
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}
```

Điều này có thể được sử dụng bên trong một mẫu trình chạy tác vụ như sau, để nhường cho luồng chính sau khi mỗi tác vụ đã được chạy:

```js
async function main() {
  // Create an array of functions to run
  const tasks = [a, b, c, d, e];

  // Loop over the tasks
  while (tasks.length > 0) {
    // Shift the first task off the tasks array
    const task = tasks.shift();

    // Run the task
    task();

    // Yield to the main thread
    await yieldFunc();
  }
}
```

Để cải thiện điều này hơn nữa, chúng ta có thể sử dụng {{domxref("Scheduler.yield()")}} khi có sẵn để cho phép mã này tiếp tục thực thi trước các tác vụ ít quan trọng hơn khác trong hàng đợi:

```js
function yieldFunc() {
  // Use scheduler.yield() if available
  if ("scheduler" in window && "yield" in scheduler) {
    return scheduler.yield();
  }

  // Fall back to setTimeout:
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}
```

## Xử lý hoạt ảnh JavaScript

Hoạt ảnh có thể cải thiện hiệu suất cảm nhận, làm cho giao diện cảm thấy nhanh nhẹn hơn và làm cho người dùng cảm thấy tiến trình đang được thực hiện khi họ đang chờ trang tải (vòng quay tải, ví dụ). Tuy nhiên, hoạt ảnh lớn hơn và số lượng hoạt ảnh cao hơn đương nhiên sẽ yêu cầu nhiều sức mạnh xử lý hơn để xử lý, điều này có thể làm suy giảm hiệu suất.

Lời khuyên hoạt ảnh rõ ràng nhất là sử dụng ít hoạt ảnh hơn — loại bỏ bất kỳ hoạt ảnh không cần thiết nào, hoặc xem xét cung cấp cho người dùng tùy chọn họ có thể đặt để tắt hoạt ảnh, ví dụ nếu họ đang sử dụng thiết bị có công suất thấp hoặc thiết bị di động với dung lượng pin hạn chế.

Đối với các hoạt ảnh DOM thiết yếu, bạn được khuyến nghị sử dụng [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) khi có thể, thay vì hoạt ảnh JavaScript ([Web Animations API](/en-US/docs/Web/API/Web_Animations_API) cung cấp cách trực tiếp kết nối vào hoạt ảnh CSS bằng JavaScript). Sử dụng trình duyệt để trực tiếp thực hiện hoạt ảnh DOM thay vì thao tác các kiểu nội tuyến bằng JavaScript nhanh hơn và hiệu quả hơn nhiều. Xem thêm [Tối ưu hóa hiệu suất CSS > Xử lý hoạt ảnh](/en-US/docs/Learn_web_development/Extensions/Performance/CSS#handling_animations).

Đối với hoạt ảnh không thể xử lý trong JavaScript, ví dụ, hoạt ảnh một HTML {{htmlelement("canvas")}}, bạn được khuyến nghị sử dụng {{domxref("Window.requestAnimationFrame()")}} thay vì các tùy chọn cũ hơn như {{domxref("Window.setInterval()")}}. Phương thức `requestAnimationFrame()` được thiết kế đặc biệt để xử lý các khung hình hoạt ảnh một cách hiệu quả và nhất quán, để có trải nghiệm người dùng mượt mà. Mẫu cơ bản trông như thế này:

```js
function loop() {
  // Clear the canvas before drawing the next frame of the animation
  ctx.fillStyle = "rgb(0 0 0 / 25%)";
  ctx.fillRect(0, 0, width, height);

  // Draw objects on the canvas and update their positioning data
  // ready for the next frame
  for (const ball of balls) {
    ball.draw();
    ball.update();
  }

  // Call requestAnimationFrame to run the loop() function again
  // at the right time to keep the animation smooth
  requestAnimationFrame(loop);
}

// Call the loop() function once to set the animation running
loop();
```

Bạn có thể tìm thấy phần giới thiệu hay về hoạt ảnh canvas tại [Vẽ đồ họa > Hoạt ảnh](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics#animations), và một ví dụ chuyên sâu hơn tại [Thực hành xây dựng đối tượng](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice). Bạn cũng có thể tìm thấy bộ hướng dẫn canvas đầy đủ tại [Hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Tối ưu hóa hiệu suất sự kiện

Sự kiện có thể tốn kém cho trình duyệt để theo dõi và xử lý, đặc biệt khi bạn chạy một sự kiện liên tục. Ví dụ, bạn có thể theo dõi vị trí của chuột bằng sự kiện {{domxref("Element/mousemove_event", "mousemove")}} để kiểm tra xem nó có còn bên trong một khu vực nhất định của trang hay không:

```js
function handleMouseMove() {
  // Do stuff while mouse pointer is inside elem
}

elem.addEventListener("mousemove", handleMouseMove);
```

Bạn có thể đang chạy trò chơi `<canvas>` trong trang của mình. Trong khi chuột ở bên trong canvas, bạn sẽ muốn liên tục kiểm tra chuyển động chuột và vị trí con trỏ và cập nhật trạng thái trò chơi — bao gồm điểm số, thời gian, vị trí của tất cả sprites, thông tin phát hiện va chạm, v.v. Khi trò chơi kết thúc, bạn sẽ không cần phải làm tất cả điều đó nữa, và trên thực tế, đó sẽ là lãng phí sức mạnh xử lý khi tiếp tục lắng nghe sự kiện đó.

Do đó, tốt nhất là loại bỏ trình lắng nghe sự kiện không còn cần thiết. Điều này có thể được thực hiện bằng cách sử dụng {{domxref("EventTarget.removeEventListener", "removeEventListener()")}}:

```js
elem.removeEventListener("mousemove", handleMouseMove);
```

Một mẹo khác là sử dụng ủy quyền sự kiện bất cứ khi nào có thể. Khi bạn có một số mã để chạy để phản hồi người dùng tương tác với bất kỳ phần tử con nào trong số nhiều phần tử con, bạn có thể đặt trình lắng nghe sự kiện trên phần tử cha của chúng. Các sự kiện được kích hoạt trên bất kỳ phần tử con nào sẽ nổi lên phần tử cha của chúng, vì vậy bạn không cần phải đặt trình lắng nghe sự kiện trên từng phần tử con riêng lẻ. Ít trình lắng nghe sự kiện hơn để theo dõi có nghĩa là hiệu suất tốt hơn.

Xem [Ủy quyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling#event_delegation) để biết thêm chi tiết và ví dụ hữu ích.

## Mẹo để viết mã hiệu quả hơn

Có một số phương pháp hay nhất chung sẽ làm cho mã của bạn chạy hiệu quả hơn.

- **Giảm thao tác DOM**: Truy cập và cập nhật DOM tốn kém về mặt tính toán, vì vậy bạn nên giảm thiểu lượng JavaScript của mình làm, đặc biệt khi thực hiện hoạt ảnh DOM liên tục (xem [Xử lý hoạt ảnh JavaScript](#handling_javascript_animations) ở trên).
- **Hàng loạt các thay đổi DOM**: Đối với các thay đổi DOM thiết yếu, bạn nên nhóm chúng thành các nhóm được thực hiện cùng nhau, thay vì chỉ kích hoạt từng thay đổi riêng lẻ khi nó xảy ra. Điều này có thể giảm lượng công việc trình duyệt đang thực hiện về mặt thực tế, nhưng cũng cải thiện hiệu suất cảm nhận. Nó có thể làm cho giao diện người dùng trông mượt mà hơn khi thực hiện một số cập nhật cùng một lúc, thay vì liên tục thực hiện các cập nhật nhỏ. Một mẹo hữu ích ở đây là — khi bạn có một đoạn HTML lớn để thêm vào trang, hãy xây dựng toàn bộ đoạn trước (thường bên trong {{domxref("DocumentFragment")}}) và sau đó thêm tất cả vào DOM trong một lần, thay vì thêm từng mục riêng biệt.
- **Đơn giản hóa HTML của bạn**: Cây DOM của bạn càng đơn giản, nó càng được truy cập và thao tác với JavaScript nhanh hơn. Hãy suy nghĩ cẩn thận về những gì giao diện người dùng của bạn cần, và loại bỏ những thứ không cần thiết.
- **Giảm lượng mã lặp**: Vòng lặp tốn kém, vì vậy hãy giảm lượng sử dụng vòng lặp trong mã của bạn bất cứ khi nào có thể. Trong các trường hợp vòng lặp không thể tránh khỏi:
  - Tránh chạy toàn bộ vòng lặp khi không cần thiết, sử dụng các câu lệnh {{jsxref("Statements/break", "break")}} hoặc {{jsxref("Statements/continue", "continue")}} khi phù hợp. Ví dụ, nếu bạn đang tìm kiếm mảng cho một tên cụ thể, bạn nên thoát khỏi vòng lặp khi tên được tìm thấy; không cần tiếp tục các lần lặp vòng lặp nữa:

    ```js
    function processGroup(array) {
      const toFind = "Bob";
      for (let i = 0; i < array.length - 1; i++) {
        if (array[i] === toFind) {
          processMatchingArray(array);
          break;
        }
      }
    }
    ```

  - Thực hiện công việc chỉ cần làm một lần bên ngoài vòng lặp. Điều này có vẻ hơi hiển nhiên, nhưng dễ bỏ qua. Hãy xem đoạn mã sau, tải xuống đối tượng JSON chứa dữ liệu cần được xử lý theo một cách nào đó. Trong trường hợp này, thao tác {{domxref("Window.fetch", "fetch()")}} đang được thực hiện trên mỗi lần lặp vòng lặp, đây là lãng phí sức mạnh tính toán. Việc tải xuống, không phụ thuộc vào `i`, có thể được chuyển ra ngoài vòng lặp, vì vậy nó chỉ được thực hiện một lần.

    ```js
    async function returnResults(number) {
      for (let i = 0; i < number; i++) {
        const response = await fetch(`/results?number=${number}`);
        const results = await response.json();
        processResult(results[i]);
      }
    }
    ```

- **Chạy tính toán ngoài luồng chính**: Trước đó, chúng ta đã nói về cách JavaScript thường chạy các tác vụ trên luồng chính, và cách các hoạt động dài có thể chặn luồng chính, có khả năng dẫn đến hiệu suất giao diện người dùng kém. Chúng ta cũng đã chỉ ra cách chia nhỏ các tác vụ dài thành các tác vụ nhỏ hơn, giảm thiểu vấn đề này. Một cách khác để xử lý các vấn đề như vậy là chuyển các tác vụ hoàn toàn ra khỏi luồng chính. Có một vài cách để đạt được điều này:
  - Sử dụng mã không đồng bộ: [JavaScript không đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing) về cơ bản là JavaScript không chặn luồng chính. Các API không đồng bộ có xu hướng xử lý các hoạt động như tải tài nguyên từ mạng, truy cập tệp trên hệ thống tệp cục bộ, hoặc mở luồng đến máy ảnh web của người dùng. Vì những hoạt động đó có thể mất nhiều thời gian, sẽ tệ nếu chỉ chặn luồng chính trong khi chúng ta chờ chúng hoàn thành. Thay vào đó, trình duyệt thực thi các hàm đó, tiếp tục chạy luồng chính mã tiếp theo, và những hàm đó sẽ trả về kết quả khi chúng có sẵn _tại một thời điểm nào đó trong tương lai_. Các API không đồng bộ hiện đại dựa trên {{jsxref("Promise")}}, là một tính năng ngôn ngữ JavaScript được thiết kế để xử lý các hoạt động không đồng bộ. Có thể [viết các hàm dựa trên Promise của riêng bạn](/en-US/docs/Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API) nếu bạn có chức năng sẽ được hưởng lợi từ việc chạy không đồng bộ.
  - Chạy tính toán trong web workers: [Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) là một cơ chế cho phép bạn mở một luồng riêng biệt để chạy một đoạn JavaScript trong đó, để nó không chặn luồng chính. Workers có một số hạn chế chính, lớn nhất là bạn không thể thực hiện bất kỳ DOM scripting nào bên trong một worker. Bạn có thể làm hầu hết các thứ khác, và workers có thể gửi và nhận tin nhắn đến và từ luồng chính. Trường hợp sử dụng chính cho workers là nếu bạn có nhiều tính toán cần làm, và bạn không muốn nó chặn luồng chính. Thực hiện tính toán đó trong worker, chờ kết quả, và gửi nó trở lại luồng chính khi đã sẵn sàng.
  - **Sử dụng WebGPU**: [WebGPU](/en-US/docs/Web/API/WebGPU_API) là API trình duyệt cho phép các nhà phát triển web sử dụng GPU (Đơn vị Xử lý Đồ họa) của hệ thống cơ bản để thực hiện các tính toán hiệu suất cao và vẽ các hình ảnh phức tạp có thể được kết xuất trong trình duyệt. Nó khá phức tạp, nhưng có thể cung cấp lợi ích hiệu suất thậm chí tốt hơn so với web workers.

## Xem thêm

- [Tối ưu hóa các tác vụ dài](https://web.dev/articles/optimize-long-tasks) trên web.dev (2022)
- [Hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial)

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/video", "Learn_web_development/Extensions/Performance/HTML", "Learn_web_development/Extensions/Performance")}}
