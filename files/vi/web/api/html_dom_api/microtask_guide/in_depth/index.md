---
title: "Chuyên sâu: Microtask và môi trường thời gian chạy JavaScript"
slug: Web/API/HTML_DOM_API/Microtask_guide/In_depth
page-type: guide
---

{{DefaultAPISidebar("HTML DOM")}}

Khi gỡ lỗi hoặc có thể khi cố gắng quyết định cách tiếp cận tốt nhất để giải quyết vấn đề liên quan đến thời gian và lập lịch task và microtask, có những thứ về cách thời gian chạy JavaScript hoạt động bên dưới có thể hữu ích để hiểu.

JavaScript vốn là ngôn ngữ đơn luồng. Nó được thiết kế trong thời đại mà đây là một lựa chọn tích cực; có ít máy tính đa bộ xử lý có sẵn cho công chúng, và lượng code dự kiến sẽ được xử lý bởi JavaScript tương đối thấp vào thời điểm đó.

Tất nhiên theo thời gian, chúng ta biết rằng máy tính đã phát triển thành các hệ thống đa lõi mạnh mẽ, và JavaScript đã trở thành một trong những ngôn ngữ được sử dụng nhiều nhất trong thế giới điện toán. Rất nhiều ứng dụng phổ biến nhất dựa ít nhất một phần vào code JavaScript. Để hỗ trợ điều này, cần phải tìm cách cho phép các dự án thoát khỏi giới hạn của ngôn ngữ đơn luồng.

Bắt đầu với việc thêm timeout và khoảng thời gian như một phần của Web API ({{domxref("Window.setTimeout", "setTimeout()")}} và {{domxref("Window.setInterval", "setInterval()")}}), môi trường JavaScript do các trình duyệt Web cung cấp dần dần tiến bộ để bao gồm các tính năng mạnh mẽ cho phép lên lịch task, phát triển ứng dụng đa luồng và nhiều hơn nữa. Để hiểu {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} đóng vai trò gì ở đây, hữu ích khi hiểu cách thời gian chạy JavaScript hoạt động khi lên lịch và chạy code.

## Ngữ cảnh thực thi JavaScript

> [!NOTE]
> Các chi tiết ở đây thường không quan trọng đối với hầu hết các lập trình viên JavaScript. Thông tin này được cung cấp như cơ sở để hiểu tại sao microtask hữu ích và chúng hoạt động như thế nào; nếu bạn không quan tâm, bạn có thể bỏ qua phần này và quay lại sau nếu thấy cần thiết.

Khi một đoạn code JavaScript chạy, nó chạy bên trong một **ngữ cảnh thực thi**. Có ba loại code tạo ra ngữ cảnh thực thi mới:

- Ngữ cảnh toàn cục là ngữ cảnh thực thi được tạo ra để chạy phần thân chính của code của bạn; tức là bất kỳ code nào tồn tại bên ngoài hàm JavaScript.
- Mỗi hàm được chạy trong ngữ cảnh thực thi riêng của nó. Đây thường được gọi là "ngữ cảnh cục bộ."
- Sử dụng hàm {{jsxref("Global_Objects/eval", "eval()")}} không nên dùng cũng tạo ra ngữ cảnh thực thi mới.

Mỗi ngữ cảnh về bản chất là một cấp độ phạm vi trong code của bạn. Khi một trong các đoạn code này bắt đầu thực thi, một ngữ cảnh mới được xây dựng để chạy nó; ngữ cảnh đó sau đó bị hủy khi code kết thúc. Hãy xem xét chương trình JavaScript dưới đây:

```js
const outputElem = document.getElementById("output");

const userLanguages = {
  Mike: "en",
  Teresa: "es",
};

function greetUser(user) {
  function localGreeting(user) {
    let greeting;
    const language = userLanguages[user];

    switch (language) {
      case "es":
        greeting = `¡Hola, ${user}!`;
        break;
      case "en":
      default:
        greeting = `Hello, ${user}!`;
        break;
    }
    return greeting;
  }
  outputElem.innerText += `${localGreeting(user)}\n`;
}

greetUser("Mike");
greetUser("Teresa");
greetUser("Veronica");
```

Chương trình ngắn này chứa ba ngữ cảnh thực thi, một số trong đó được tạo và hủy nhiều lần trong quá trình thực thi chương trình. Khi mỗi ngữ cảnh được tạo, nó được đặt vào **ngăn xếp ngữ cảnh thực thi**. Khi nó kết thúc, ngữ cảnh được xóa khỏi ngăn xếp ngữ cảnh.

- Khi bắt đầu chương trình, ngữ cảnh toàn cục được tạo.
  - Khi đến `greetUser("Mike")`, một ngữ cảnh được tạo cho hàm `greetUser()`; ngữ cảnh thực thi này được đẩy vào ngăn xếp ngữ cảnh thực thi.
    - Khi `greetUser()` gọi `localGreeting()`, ngữ cảnh khác được tạo để chạy hàm đó. Khi hàm này trả về, ngữ cảnh cho `localGreeting()` bị xóa khỏi ngăn xếp thực thi và bị hủy. Quá trình thực thi chương trình tiếp tục với ngữ cảnh tiếp theo được tìm thấy trên ngăn xếp, là `greetUser()`; hàm này tiếp tục thực thi từ nơi nó dừng lại.
    - Hàm `greetUser()` trả về và ngữ cảnh của nó bị xóa khỏi ngăn xếp và bị hủy.

  - Khi đến `greetUser("Teresa")`, ngữ cảnh được tạo cho nó và đẩy vào ngăn xếp.
    - Khi `greetUser()` gọi `localGreeting()`, ngữ cảnh khác được tạo để chạy hàm đó. Khi hàm này trả về, ngữ cảnh cho `localGreeting()` bị xóa khỏi ngăn xếp thực thi và bị hủy. `greetUser()` tiếp tục thực thi từ nơi nó dừng lại.
    - Hàm `greetUser()` trả về và ngữ cảnh của nó bị xóa khỏi ngăn xếp và bị hủy.

  - Khi đến `greetUser("Veronica")`, ngữ cảnh được tạo cho nó và đẩy vào ngăn xếp.
    - Khi `greetUser()` gọi `localGreeting()`, ngữ cảnh khác được tạo để chạy hàm đó. Khi hàm này trả về, ngữ cảnh cho `localGreeting()` bị xóa khỏi ngăn xếp thực thi và bị hủy.
    - Hàm `greetUser()` trả về và ngữ cảnh của nó bị xóa khỏi ngăn xếp và bị hủy.

- Chương trình chính kết thúc và ngữ cảnh thực thi của nó bị xóa khỏi ngăn xếp thực thi; vì không còn ngữ cảnh nào trên ngăn xếp, quá trình thực thi chương trình kết thúc.

Bằng cách sử dụng ngữ cảnh thực thi theo cách này, mỗi chương trình và hàm có thể có tập hợp biến và đối tượng riêng của mình. Mỗi ngữ cảnh ngoài ra còn theo dõi dòng tiếp theo trong chương trình sẽ chạy và các thông tin khác quan trọng cho hoạt động của ngữ cảnh đó. Bằng cách sử dụng ngữ cảnh và ngăn xếp ngữ cảnh theo cách này, nhiều nguyên tắc cơ bản về cách một chương trình hoạt động có thể được quản lý, bao gồm biến cục bộ và toàn cục, gọi hàm và trả về, v.v.

Một lưu ý đặc biệt về hàm đệ quy, tức là các hàm tự gọi chính mình, có thể qua nhiều cấp độ chiều sâu hoặc đệ quy: mỗi lần gọi đệ quy đến hàm tạo ra ngữ cảnh thực thi mới. Điều này cho phép thời gian chạy JavaScript theo dõi các cấp độ đệ quy và việc trả về kết quả qua đệ quy đó, nhưng cũng có nghĩa là mỗi khi hàm đệ quy, cần thêm bộ nhớ để tạo ngữ cảnh mới.

## Chạy, JavaScript, chạy

Để chạy code JavaScript, bộ máy thời gian chạy duy trì một tập hợp **agents** để thực thi code JavaScript. Mỗi agent được tạo thành từ một tập hợp ngữ cảnh thực thi, ngăn xếp ngữ cảnh thực thi, luồng chính, một tập hợp cho bất kỳ luồng bổ sung nào có thể được tạo để xử lý worker, hàng đợi task và hàng đợi microtask. Ngoại trừ luồng chính (mà một số trình duyệt chia sẻ giữa nhiều agent), mỗi thành phần của một agent là duy nhất cho agent đó.

Ở đây chúng ta xem cách thời gian chạy hoạt động chi tiết hơn một chút.

### Vòng lặp sự kiện

Mỗi agent được điều khiển bởi một [vòng lặp sự kiện](/en-US/docs/Web/JavaScript/Reference/Execution_model), được xử lý lặp đi lặp lại. Trong mỗi lần lặp, nó chạy nhiều nhất một task JavaScript đang chờ, sau đó bất kỳ microtask đang chờ nào, rồi thực hiện bất kỳ việc hiển thị và vẽ nào cần thiết trước khi lặp lại.

Code của trang web hoặc ứng dụng của bạn chạy trong cùng **{{Glossary("thread")}}**, chia sẻ cùng **vòng lặp sự kiện**, với giao diện người dùng của bản thân trình duyệt web. Đây là **{{Glossary("main thread")}}**, và ngoài việc chạy phần thân code chính của trang bạn, nó còn xử lý nhận và gửi sự kiện người dùng và sự kiện khác, hiển thị và vẽ nội dung web, v.v.

Vòng lặp sự kiện, sau đó, điều khiển mọi thứ xảy ra trong trình duyệt liên quan đến tương tác với người dùng, nhưng quan trọng hơn cho mục đích của chúng ta ở đây, nó chịu trách nhiệm lên lịch và thực thi mọi đoạn code chạy trong luồng của nó.

Có ba loại vòng lặp sự kiện:

- Vòng lặp sự kiện cửa sổ
  - : Vòng lặp sự kiện cửa sổ là loại điều khiển tất cả các cửa sổ chia sẻ nguồn gốc tương tự (mặc dù có thêm giới hạn về điều này như được mô tả bên dưới).
- Vòng lặp sự kiện worker
  - : Vòng lặp sự kiện worker là loại điều khiển worker; điều này bao gồm tất cả các dạng worker, bao gồm [web worker](/en-US/docs/Web/API/Web_Workers_API) cơ bản, [shared worker](/en-US/docs/Web/API/SharedWorker) và [service worker](/en-US/docs/Web/API/Service_Worker_API). Worker được giữ trong một hoặc nhiều agent riêng biệt với code "chính"; trình duyệt có thể sử dụng một vòng lặp sự kiện duy nhất cho tất cả worker của loại nhất định hoặc có thể sử dụng nhiều vòng lặp sự kiện để xử lý chúng.
- Vòng lặp sự kiện worklet
  - : Vòng lặp sự kiện {{domxref("Worklet", "worklet", "", 1)}} là vòng lặp sự kiện được sử dụng để điều khiển các agent chạy code cho các worklet của một agent nhất định. Điều này bao gồm worklet thuộc loại {{domxref("Worklet")}} và {{domxref("AudioWorklet")}}.

Một số cửa sổ được tải từ cùng {{Glossary("origin")}} có thể đang chạy trên cùng vòng lặp sự kiện, mỗi cửa sổ thêm task vào vòng lặp sự kiện để task của chúng luân phiên với bộ xử lý, lần lượt từng cái một. Hãy nhớ rằng trong thuật ngữ web, từ "cửa sổ" thực sự có nghĩa là "vùng chứa cấp trình duyệt mà nội dung web chạy trong đó," bao gồm cửa sổ thực tế, tab hoặc frame.

Có các trường hợp cụ thể trong đó việc chia sẻ vòng lặp sự kiện giữa các cửa sổ có cùng nguồn gốc là có thể, chẳng hạn như:

- Nếu một cửa sổ mở cửa sổ kia, chúng có thể đang chia sẻ vòng lặp sự kiện.
- Nếu một cửa sổ thực sự là vùng chứa trong {{HTMLElement("iframe")}}, nó có thể chia sẻ vòng lặp sự kiện với cửa sổ chứa nó.
- Các cửa sổ chia sẻ cùng tiến trình trong triển khai trình duyệt đa tiến trình.

Các chi tiết cụ thể có thể thay đổi tùy theo trình duyệt, tùy thuộc vào cách chúng được triển khai.

#### Task và microtask

**Task** là bất cứ điều gì được lên lịch để chạy bởi các cơ chế tiêu chuẩn như bắt đầu thực thi script ban đầu, gửi sự kiện không đồng bộ, v.v. Ngoài việc sử dụng sự kiện, bạn có thể thêm task vào hàng đợi bằng cách sử dụng {{domxref("Window.setTimeout", "setTimeout()")}} hoặc {{domxref("Window.setInterval", "setInterval()")}}.

Sự khác biệt giữa hàng đợi task và hàng đợi microtask thì đơn giản nhưng rất quan trọng:

- Khi một lần lặp mới của vòng lặp sự kiện bắt đầu, thời gian chạy thực thi task tiếp theo từ hàng đợi task. Các task thêm vào hàng đợi sau khi bắt đầu lần lặp _sẽ không chạy cho đến lần lặp tiếp theo_.
- Bất cứ khi nào một task kết thúc và ngăn xếp ngữ cảnh thực thi trống, tất cả microtask trong hàng đợi microtask được thực thi lần lượt. Điểm khác biệt là việc thực thi microtask tiếp tục cho đến khi hàng đợi trống, ngay cả khi có microtask mới được lên lịch trong thời gian đó. Nói cách khác, microtask có thể thêm microtask mới và những microtask mới đó sẽ thực thi trước khi task tiếp theo bắt đầu chạy, và trước khi lần lặp vòng lặp sự kiện hiện tại kết thúc.

### Vấn đề

Vì code của bạn chạy trong cùng luồng, sử dụng cùng vòng lặp sự kiện, với giao diện người dùng của trình duyệt, nếu code của bạn bị chặn hoặc rơi vào vòng lặp vô tận, bản thân trình duyệt sẽ bị treo. Ngay cả hiệu suất chậm, dù do lỗi hay do công việc phức tạp được thực hiện bởi code của bạn, cũng có thể khiến người dùng gặp phải trình duyệt chậm chạp.

Khi nhiều chương trình và nhiều đối tượng code trong các chương trình đó bắt đầu cố gắng hoạt động cùng một lúc, bên cạnh trình duyệt cũng cần thời gian xử lý, chưa kể đến thời gian để hiển thị và vẽ trang và giao diện người dùng của chính nó, xử lý sự kiện người dùng, v.v., mọi thứ trở nên tắc nghẽn quá dễ dàng ngày nay.

### Giải pháp

Việc sử dụng [web worker](/en-US/docs/Web/API/Web_Workers_API), cho phép script chính chạy các script khác trong luồng mới, giúp giảm bớt vấn đề này. Một trang web hoặc ứng dụng được thiết kế tốt sử dụng worker để thực hiện bất kỳ thao tác phức tạp hoặc dài nào, để luồng chính làm ít công việc nhất có thể ngoài việc cập nhật, bố cục và hiển thị trang web.

Điều này được giảm bớt thêm bằng cách sử dụng các kỹ thuật [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS) chẳng hạn như {{jsxref("Global_Objects/Promise", "promise", "", 1)}} để cho phép code chính tiếp tục chạy trong khi chờ kết quả của yêu cầu. Tuy nhiên, code chạy ở cấp độ cơ bản hơn, chẳng hạn như code tạo thành thư viện hoặc framework, có thể cần cách để lên lịch code chạy vào thời điểm an toàn trong khi vẫn thực thi trên luồng chính, độc lập với kết quả của bất kỳ yêu cầu hoặc task đơn lẻ nào.

Microtask là giải pháp khác cho vấn đề này, cung cấp mức độ truy cập tốt hơn bằng cách cho phép lên lịch code chạy trước khi lần lặp tiếp theo của vòng lặp sự kiện bắt đầu, thay vì phải chờ đến lần tiếp theo.

Hàng đợi microtask đã tồn tại được một thời gian, nhưng trong lịch sử chỉ được sử dụng nội bộ để điều khiển những thứ như promise. Việc bổ sung {{domxref("Window.queueMicrotask()", "queueMicrotask()")}}, cung cấp nó cho nhà phát triển web, tạo ra một hàng đợi thống nhất cho microtask được sử dụng ở bất cứ nơi nào cần khả năng lên lịch code chạy an toàn khi không còn ngữ cảnh thực thi nào trên ngăn xếp ngữ cảnh thực thi JavaScript. Trên nhiều phiên bản và trên tất cả các trình duyệt và thời gian chạy JavaScript, một cơ chế hàng đợi được tiêu chuẩn hóa có nghĩa là các microtask này sẽ hoạt động đáng tin cậy theo cùng thứ tự, do đó tránh được các lỗi có thể khó tìm.

## Xem thêm

- [Hướng dẫn microtask](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide)
- {{domxref("Window.queueMicrotask()")}}
- [Vòng lặp sự kiện](/en-US/docs/Web/JavaScript/Reference/Execution_model)
- [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS)
  - [Giới thiệu JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing)
  - [Lập trình bất đồng bộ duyên dáng với Promises](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises)
