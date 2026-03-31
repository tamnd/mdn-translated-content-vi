---
title: JavaScript execution model
slug: Web/JavaScript/Reference/Execution_model
page-type: guide
spec-urls:
  - https://tc39.es/ecma262/multipage/executable-code-and-execution-contexts.html
  - https://tc39.es/ecma262/multipage/memory-model.html
  - https://html.spec.whatwg.org/multipage/webappapis.html
sidebar: jssidebar
---

Trang này giới thiệu cơ sở hạ tầng cơ bản của môi trường runtime JavaScript. Mô hình phần lớn mang tính lý thuyết và trừu tượng, không có bất kỳ chi tiết nào về nền tảng cụ thể hoặc triển khai cụ thể. Các JavaScript engine hiện đại tối ưu hóa nặng nề các ngữ nghĩa được mô tả.

Trang này là tài liệu tham chiếu. Nó giả định bạn đã quen với mô hình thực thi của các ngôn ngữ lập trình khác, chẳng hạn như C và Java. Nó tham chiếu nhiều đến các khái niệm hiện có trong hệ điều hành và ngôn ngữ lập trình.

## Engine và host

Việc thực thi JavaScript đòi hỏi sự hợp tác của hai phần mềm: **JavaScript engine** và **môi trường host**.

JavaScript engine triển khai [ngôn ngữ ECMAScript (JavaScript)](/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview#javascript_the_core_language_ecmascript), cung cấp các chức năng cốt lõi. Nó nhận source code, phân tích cú pháp và thực thi. Tuy nhiên, để tương tác với thế giới bên ngoài, chẳng hạn như tạo ra bất kỳ đầu ra có ý nghĩa nào, giao tiếp với các tài nguyên bên ngoài, hoặc triển khai các cơ chế liên quan đến bảo mật hoặc hiệu năng, chúng ta cần các cơ chế bổ sung dành riêng cho môi trường do môi trường host cung cấp. Ví dụ, HTML DOM là môi trường host khi JavaScript được thực thi trong trình duyệt web. Node.js là một môi trường host khác cho phép JavaScript chạy ở phía máy chủ.

Mặc dù chúng ta chủ yếu tập trung vào các cơ chế được định nghĩa trong ECMAScript trong tài liệu tham chiếu này, đôi khi chúng ta sẽ đề cập đến các cơ chế được định nghĩa trong HTML spec, thường được bắt chước bởi các môi trường host khác như Node.js hoặc Deno. Bằng cách này, chúng ta có thể đưa ra bức tranh nhất quán về mô hình thực thi JavaScript được sử dụng trên web và hơn thế nữa.

## Mô hình thực thi agent

Trong đặc tả JavaScript, mỗi thực thể thực thi JavaScript độc lập được gọi là một **agent**, duy trì các phương tiện của mình để thực thi code:

- **Heap** (của các đối tượng): đây chỉ là tên để biểu thị một vùng bộ nhớ lớn (phần lớn không có cấu trúc). Nó được lấp đầy khi các đối tượng được tạo ra trong chương trình. Lưu ý rằng trong trường hợp bộ nhớ được chia sẻ, mỗi agent có heap riêng với phiên bản riêng của đối tượng {{jsxref("SharedArrayBuffer")}}, nhưng bộ nhớ cơ bản được biểu thị bởi buffer được chia sẻ.
- [**Queue** (của các job)](#job_queue_and_event_loop): điều này được biết đến trong HTML (và cũng phổ biến) là _event loop_ cho phép lập trình bất đồng bộ trong JavaScript trong khi vẫn là single-threaded. Nó được gọi là queue vì nó thường là first-in-first-out: các job trước đó được thực thi trước các job sau.
- [**Stack** (của các execution context)](#stack_and_execution_contexts): đây là những gì được biết đến là _call stack_ và cho phép chuyển luồng điều khiển bằng cách vào và thoát khỏi các execution context như hàm. Nó được gọi là stack vì nó là last-in-first-out. Mỗi job bắt đầu bằng cách đẩy một frame mới lên (ngăn xếp trống), và kết thúc bằng cách làm trống ngăn xếp.

Đây là ba cấu trúc dữ liệu riêng biệt theo dõi các dữ liệu khác nhau. Chúng ta sẽ giới thiệu queue và stack chi tiết hơn trong các phần sau. Để đọc thêm về cách bộ nhớ heap được cấp phát và giải phóng, xem [quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management).

Mỗi agent tương tự như một thread (lưu ý rằng việc triển khai bên dưới có thể hoặc không thể là một thread hệ điều hành thực sự). Mỗi agent có thể sở hữu nhiều [realm](#realms) (tương ứng 1-to-1 với các global object) có thể truy cập đồng bộ với nhau, và do đó cần chạy trong một luồng thực thi duy nhất. Một agent cũng có một mô hình bộ nhớ duy nhất, cho biết liệu nó là little-endian, liệu nó có thể bị [blocked đồng bộ](#concurrency_and_ensuring_forward_progress), liệu các hoạt động atomic có [lock-free](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Atomics/isLockFree) hay không, v.v.

Một agent trên web có thể là một trong những loại sau:

- Một _Similar-origin window agent_, chứa các đối tượng {{domxref("Window")}} khác nhau có thể tiếp cận nhau, trực tiếp hoặc bằng cách sử dụng {{domxref("Document/domain", "document.domain")}}. Nếu window là [origin-keyed](/en-US/docs/Web/API/Window/originAgentCluster), thì chỉ các window cùng origin mới có thể tiếp cận nhau.
- Một _Dedicated worker agent_ chứa một {{domxref("DedicatedWorkerGlobalScope")}} duy nhất.
- Một _Shared worker agent_ chứa một {{domxref("SharedWorkerGlobalScope")}} duy nhất.
- Một _Service worker agent_ chứa một {{domxref("ServiceWorkerGlobalScope")}} duy nhất.
- Một _Worklet agent_ chứa một {{domxref("WorkletGlobalScope")}} duy nhất.

Nói cách khác, mỗi worker tạo ra agent riêng của nó, trong khi một hoặc nhiều window có thể nằm trong cùng một agent—thường là tài liệu chính và các iframe cùng origin của nó. Trong Node.js, một khái niệm tương tự gọi là [worker threads](https://nodejs.org/api/worker_threads.html) được hỗ trợ.

Sơ đồ dưới đây minh họa mô hình thực thi của các agent:

![A diagram consisting of two agents: one HTML page and one worker. Each has its own stack containing execution contexts, heap containing objects, and queue containing jobs.](runtime-environment-diagram.svg)

## Realm

Mỗi agent sở hữu một hoặc nhiều **realm**. Mỗi đoạn code JavaScript được liên kết với một realm khi nó được nạp, điều này không thay đổi ngay cả khi được gọi từ một realm khác. Một realm bao gồm các thông tin sau:

- Một danh sách các intrinsic object như `Array`, `Array.prototype`, v.v.
- Các biến được khai báo toàn cục, giá trị của [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis), và global object
- Một bộ nhớ đệm của [mảng template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates), vì việc đánh giá cùng một biểu thức tagged template literal luôn khiến tag nhận được cùng một đối tượng mảng

Trên web, realm và global object tương ứng 1-to-1. Global object là {{domxref("Window")}}, {{domxref("WorkerGlobalScope")}}, hoặc {{domxref("WorkletGlobalScope")}}. Vì vậy, ví dụ, mỗi `iframe` thực thi trong một realm khác, mặc dù nó có thể nằm trong cùng một agent với window cha.

Realm thường được đề cập khi nói về danh tính của các global object. Ví dụ, chúng ta cần các phương thức như {{jsxref("Array.isArray()")}} hoặc {{jsxref("Error.isError()")}}, vì một mảng được tạo trong realm khác sẽ có đối tượng prototype khác với đối tượng `Array.prototype` trong realm hiện tại, vì vậy `instanceof Array` sẽ sai khi trả về `false`.

## Stack và execution context

Chúng ta đầu tiên xem xét việc thực thi code đồng bộ. Mỗi [job](#job_queue_and_event_loop) bắt đầu bằng cách gọi callback liên quan của nó. Code bên trong callback này có thể tạo biến, gọi hàm, hoặc thoát. Mỗi hàm cần theo dõi môi trường biến riêng của nó và nơi để trở về. Để xử lý điều này, agent cần một stack để theo dõi các execution context. Một **execution context**, còn được biết đến là _stack frame_, là đơn vị thực thi nhỏ nhất. Nó theo dõi các thông tin sau:

- Trạng thái đánh giá code
- Module hoặc script, hàm (nếu có), và [generator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) đang thực thi hiện tại chứa code này
- [Realm](#realms) hiện tại
- [Binding](/en-US/docs/Glossary/Binding), bao gồm:
  - Các biến được định nghĩa với `var`, `let`, `const`, `function`, `class`, v.v.
  - Các định danh private như `#foo` chỉ hợp lệ trong context hiện tại
  - Tham chiếu `this`

Hãy tưởng tượng một chương trình bao gồm một job duy nhất được định nghĩa bởi code sau:

```js
function foo(b) {
  const a = 10;
  return a + b + 11;
}

function bar(x) {
  const y = 3;
  return foo(x * y);
}

const baz = bar(7); // assigns 42 to baz
```

1. Khi job bắt đầu, frame đầu tiên được tạo, nơi các biến `foo`, `bar`, và `baz` được định nghĩa. Nó gọi `bar` với đối số `7`.
2. Một frame thứ hai được tạo cho lời gọi `bar`, chứa các binding cho tham số `x` và biến cục bộ `y`. Nó đầu tiên thực hiện phép nhân `x * y`, sau đó gọi `foo` với kết quả.
3. Một frame thứ ba được tạo cho lời gọi `foo`, chứa các binding cho tham số `b` và biến cục bộ `a`. Nó đầu tiên thực hiện phép cộng `a + b + 11`, sau đó trả về kết quả.
4. Khi `foo` trả về, phần tử frame trên cùng được bật ra khỏi stack, và biểu thức gọi `foo(x * y)` được giải quyết thành giá trị trả về. Sau đó nó tiếp tục thực thi, chỉ để trả về kết quả này.
5. Khi `bar` trả về, phần tử frame trên cùng được bật ra khỏi stack, và biểu thức gọi `bar(7)` được giải quyết thành giá trị trả về. Điều này khởi tạo `baz` với giá trị trả về.
6. Chúng ta đến cuối source code của job, vì vậy stack frame cho entrypoint được bật ra khỏi stack. Stack trống, vì vậy job được coi là đã hoàn thành.

### Generator và reentry

Khi một frame được bật ra, nó không nhất thiết biến mất mãi mãi, vì đôi khi chúng ta cần quay lại nó. Ví dụ, hãy xem xét một generator function:

```js
function* gen() {
  console.log(1);
  yield;
  console.log(2);
}

const g = gen();
g.next(); // logs 1
g.next(); // logs 2
```

Trong trường hợp này, gọi `gen()` đầu tiên tạo ra một execution context bị tạm dừng—không có code nào bên trong `gen` được thực thi ngay. Generator `g` lưu execution context này bên trong. Execution context đang chạy hiện tại vẫn là entrypoint. Khi `g.next()` được gọi, execution context cho `gen` được đẩy lên stack, và code bên trong `gen` được thực thi cho đến biểu thức `yield`. Sau đó, execution context của generator bị tạm dừng và xóa khỏi stack, trả quyền điều khiển về entrypoint. Khi `g.next()` được gọi lần nữa, execution context của generator được đẩy trở lại lên stack, và code bên trong `gen` tiếp tục từ nơi nó dừng lại.

### Tail call

Một cơ chế được định nghĩa trong đặc tả là _proper tail call_ (PTC). Một lời gọi hàm là tail call nếu caller không làm gì sau lời gọi ngoại trừ trả về giá trị:

```js
function f() {
  return g();
}
```

Trong trường hợp này, lời gọi đến `g` là một tail call. Nếu một lời gọi hàm ở vị trí tail, engine được yêu cầu loại bỏ execution context hiện tại và thay thế bằng context của tail call, thay vì đẩy một frame mới cho lời gọi `g()`. Điều này có nghĩa là đệ quy đuôi không phải chịu giới hạn kích thước stack:

```js
function factorial(n, acc = 1) {
  if (n <= 1) return acc;
  return factorial(n - 1, n * acc);
}
```

Trong thực tế, việc loại bỏ frame hiện tại gây ra vấn đề gỡ lỗi, vì nếu `g()` ném lỗi, `f` không còn trên stack và sẽ không xuất hiện trong stack trace. Hiện tại, chỉ Safari (JavaScriptCore) triển khai PTC, và họ đã phát minh ra một số [cơ sở hạ tầng cụ thể](https://webkit.org/blog/6240/ecmascript-6-proper-tail-calls-in-webkit/) để giải quyết vấn đề debuggability.

### Closure

Một hiện tượng thú vị khác liên quan đến phạm vi biến và lời gọi hàm là [closure](/en-US/docs/Web/JavaScript/Guide/Closures). Bất cứ khi nào một hàm được tạo ra, nó cũng ghi nhớ nội bộ các binding biến của execution context đang chạy hiện tại. Sau đó, các binding biến này có thể tồn tại lâu hơn execution context.

```js
let f;
{
  let x = 10;
  f = () => x;
}
console.log(f()); // logs 10
```

## Job queue và event loop

Một agent là một thread, có nghĩa là interpreter chỉ có thể xử lý một câu lệnh tại một thời điểm. Khi code hoàn toàn đồng bộ, điều này ổn vì chúng ta luôn có thể tiến lên. Nhưng nếu code cần thực hiện hành động bất đồng bộ, thì chúng ta không thể tiến lên trừ khi hành động đó hoàn thành. Tuy nhiên, sẽ gây hại cho trải nghiệm người dùng nếu điều đó làm dừng toàn bộ chương trình—bản chất của JavaScript như một ngôn ngữ scripting web yêu cầu nó phải [không bao giờ bị chặn](#never_blocking). Do đó, code xử lý hoàn thành hành động bất đồng bộ đó được định nghĩa là callback. Callback này định nghĩa một **job**, được đặt vào một **job queue**—hoặc, theo thuật ngữ HTML, là event loop—khi hành động đã hoàn thành.

Mỗi lần, agent lấy một job từ queue và thực thi nó. Khi job được thực thi, nó có thể tạo ra nhiều job hơn, được thêm vào cuối queue. Các job cũng có thể được thêm vào thông qua việc hoàn thành các cơ chế nền tảng bất đồng bộ, chẳng hạn như timer, I/O, và event. Một job được coi là hoàn thành khi [stack](#stack_and_execution_contexts) trống; sau đó, job tiếp theo được lấy từ queue. Các job có thể không được lấy với mức độ ưu tiên đồng đều—ví dụ, các event loop HTML chia các job thành hai loại: _task_ và _microtask_. Microtask có mức độ ưu tiên cao hơn và microtask queue được xả trước khi task queue được lấy. Để biết thêm thông tin, hãy xem [hướng dẫn HTML microtask](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide). Nếu job queue trống, agent chờ thêm job được thêm vào.

### "Run-to-completion"

Mỗi job được xử lý hoàn toàn trước khi bất kỳ job nào khác được xử lý. Điều này cung cấp một số thuộc tính hữu ích khi suy luận về chương trình của bạn, bao gồm thực tế là bất cứ khi nào một hàm chạy, nó không thể bị ngắt và sẽ chạy hoàn toàn trước khi bất kỳ code nào khác chạy (và có thể sửa đổi dữ liệu mà hàm thao tác). Điều này khác với C, chẳng hạn, nơi nếu một hàm chạy trong một thread, nó có thể bị dừng tại bất kỳ điểm nào bởi hệ thống runtime để chạy code khác trong một thread khác.

Ví dụ, hãy xem xét ví dụ này:

```js
const promise = Promise.resolve();
let i = 0;
promise.then(() => {
  i += 1;
  console.log(i);
});
promise.then(() => {
  i += 1;
  console.log(i);
});
```

Trong ví dụ này, chúng ta tạo một promise đã được giải quyết, có nghĩa là bất kỳ callback nào được đính kèm vào nó sẽ được lên lịch ngay lập tức là các job. Hai callback có vẻ gây ra race condition, nhưng thực ra, đầu ra hoàn toàn có thể dự đoán được: `1` và `2` sẽ được ghi theo thứ tự. Điều này là vì mỗi job chạy hoàn chỉnh trước khi job tiếp theo được thực thi, vì vậy thứ tự tổng thể luôn là `i += 1; console.log(i); i += 1; console.log(i);` và không bao giờ là `i += 1; i += 1; console.log(i); console.log(i);`.

Một nhược điểm của mô hình này là nếu một job mất quá nhiều thời gian để hoàn thành, ứng dụng web không thể xử lý các tương tác người dùng như click hoặc scroll. Trình duyệt giảm thiểu điều này với hộp thoại "a script is taking too long to run". Một thực hành tốt cần tuân theo là làm cho việc xử lý job ngắn gọn và, nếu có thể, chia một job thành nhiều job.

### Không bao giờ bị chặn

Một đảm bảo quan trọng khác được cung cấp bởi mô hình event loop là việc thực thi JavaScript không bao giờ bị chặn. Việc xử lý I/O thường được thực hiện thông qua event và callback, vì vậy khi ứng dụng đang chờ một truy vấn [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) trả về hoặc một yêu cầu [`fetch()`](/en-US/docs/Web/API/Window/fetch) trả về, nó vẫn có thể xử lý các thứ khác như input của người dùng. Code được thực thi sau khi hoàn thành một hành động bất đồng bộ luôn được cung cấp dưới dạng callback function (ví dụ, trình xử lý {{jsxref("Promise/then", "then()")}} của promise, hàm callback trong `setTimeout()`, hoặc event handler), định nghĩa một job được thêm vào job queue khi hành động hoàn thành.

Tất nhiên, đảm bảo "không bao giờ bị chặn" yêu cầu API nền tảng phải vốn dĩ là bất đồng bộ, nhưng một số ngoại lệ cũ tồn tại như `alert()` hoặc XHR đồng bộ. Được coi là thực hành tốt khi tránh chúng để đảm bảo khả năng phản hồi của ứng dụng.

## Cụm agent và chia sẻ bộ nhớ

Nhiều agent có thể giao tiếp thông qua chia sẻ bộ nhớ, tạo thành một **cụm agent**. Các agent nằm trong cùng một cụm nếu và chỉ nếu chúng có thể chia sẻ bộ nhớ. Không có cơ chế tích hợp nào để hai cụm agent trao đổi bất kỳ thông tin nào, vì vậy chúng có thể được coi là các mô hình thực thi hoàn toàn cách biệt.

Khi tạo một agent (chẳng hạn bằng cách tạo ra một worker), có một số tiêu chí để xác định liệu nó có nằm trong cùng cụm với agent hiện tại, hay một cụm mới được tạo ra. Ví dụ, các cặp global object sau đây mỗi cái nằm trong cùng một cụm agent, và do đó có thể chia sẻ bộ nhớ với nhau:

- Một đối tượng `Window` và một dedicated worker mà nó đã tạo ra.
- Một worker (bất kỳ loại nào) và một dedicated worker mà nó đã tạo ra.
- Một đối tượng `Window` A và đối tượng `Window` của một phần tử `iframe` cùng origin mà A đã tạo ra.
- Một đối tượng `Window` và một đối tượng `Window` cùng origin đã mở nó.
- Một đối tượng `Window` và một worklet mà nó đã tạo ra.

Các cặp global object sau đây không nằm trong cùng một cụm agent, và do đó không thể chia sẻ bộ nhớ:

- Một đối tượng `Window` và một shared worker mà nó đã tạo ra.
- Một worker (bất kỳ loại nào) và một shared worker mà nó đã tạo ra.
- Một đối tượng `Window` và một service worker mà nó đã tạo ra.
- Một đối tượng `Window` A và đối tượng `Window` của một phần tử `iframe` mà A đã tạo ra mà không thể cùng origin với A.
- Bất kỳ hai đối tượng `Window` nào không có mối quan hệ opener hoặc ancestor. Điều này đúng ngay cả khi hai đối tượng `Window` cùng origin.

Để biết thuật toán chính xác, hãy xem [HTML specification](https://html.spec.whatwg.org/multipage/webappapis.html#integration-with-the-javascript-agent-cluster-formalism).

### Giao tiếp cross-agent và mô hình bộ nhớ

Như đã đề cập, các agent giao tiếp thông qua chia sẻ bộ nhớ. Trên web, bộ nhớ được chia sẻ thông qua phương thức [`postMessage()`](/en-US/docs/Web/API/Window/postMessage). Hướng dẫn [using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) cung cấp tổng quan về điều này. Thông thường, dữ liệu được truyền chỉ theo giá trị (thông qua [structured cloning](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm)), và do đó không liên quan đến bất kỳ phức tạp về đồng thời nào. Để chia sẻ bộ nhớ, người ta phải post một đối tượng {{jsxref("SharedArrayBuffer")}}, có thể được nhiều agent truy cập đồng thời. Khi hai agent chia sẻ quyền truy cập vào cùng một bộ nhớ thông qua `SharedArrayBuffer`, họ có thể đồng bộ hóa việc thực thi thông qua đối tượng {{jsxref("Atomics")}}.

Có hai cách để truy cập bộ nhớ được chia sẻ: thông qua truy cập bộ nhớ thông thường (không phải atomic) và thông qua truy cập bộ nhớ atomic. Loại sau [nhất quán tuần tự](https://en.wikipedia.org/wiki/Sequential_consistency) (có nghĩa là có một thứ tự toàn phần nghiêm ngặt của các sự kiện được đồng ý bởi tất cả các agent trong cụm), trong khi loại trước không có thứ tự (có nghĩa là không có thứ tự nào tồn tại); JavaScript không cung cấp các hoạt động với các đảm bảo thứ tự khác.

Đặc tả cung cấp các hướng dẫn sau cho các lập trình viên làm việc với bộ nhớ được chia sẻ:

> Chúng tôi khuyến nghị các chương trình được giữ không có data race, tức là làm cho nó không thể có các hoạt động non-atomic đồng thời trên cùng một vị trí bộ nhớ. Các chương trình không có data race có ngữ nghĩa interleaving nơi mỗi bước trong ngữ nghĩa đánh giá của mỗi agent được xen kẽ với nhau. Đối với các chương trình không có data race, không cần thiết phải hiểu chi tiết của mô hình bộ nhớ. Chi tiết không có khả năng xây dựng trực giác giúp viết ECMAScript tốt hơn.
>
> Tổng quát hơn, ngay cả khi một chương trình không không có data race, nó vẫn có thể có hành vi có thể dự đoán, miễn là các hoạt động atomic không tham gia vào bất kỳ data race nào và các hoạt động race đều có cùng kích thước truy cập. Cách đơn giản nhất để đảm bảo atomic không tham gia vào race là đảm bảo rằng các ô nhớ khác nhau được sử dụng bởi các hoạt động atomic và non-atomic và các truy cập atomic có kích thước khác nhau không được sử dụng để truy cập cùng một ô cùng một lúc. Thực tế, chương trình nên coi bộ nhớ được chia sẻ là strongly typed càng nhiều càng tốt. Người ta vẫn không thể phụ thuộc vào thứ tự và thời gian của các truy cập non-atomic race, nhưng nếu bộ nhớ được coi là strongly typed, các truy cập racing sẽ không "tear" (các bit của giá trị của chúng sẽ không bị trộn lẫn).

### Đồng thời và đảm bảo tiến độ

Khi nhiều agent hợp tác, đảm bảo [không bao giờ bị chặn](#never_blocking) không phải lúc nào cũng đúng. Một agent có thể bị _blocked_, hoặc bị tạm dừng, trong khi chờ một agent khác thực hiện một số hành động. Điều này khác với việc chờ một promise trong cùng một agent, vì nó dừng toàn bộ agent và không cho phép bất kỳ code nào khác chạy trong thời gian đó—nói cách khác, nó không thể đạt được _tiến độ_.

Để ngăn deadlock, có một số hạn chế mạnh về thời điểm và agent nào có thể bị blocked.

- Mỗi agent chưa bị blocked với một luồng thực thi chuyên dụng cuối cùng đạt được tiến độ.
- Trong một tập hợp các agent chia sẻ một luồng thực thi, một agent cuối cùng đạt được tiến độ.
- Một agent không khiến một agent khác bị blocked ngoại trừ thông qua các API tường minh cung cấp blocking.
- Chỉ một số agent nhất định có thể bị blocked. Trên web, điều này bao gồm dedicated worker và shared worker, nhưng không phải similar-origin window hoặc service worker.

Cụm agent đảm bảo một mức độ tính toàn vẹn nhất định đối với tính hoạt động của các agent của nó, trong trường hợp bị tạm dừng hoặc chấm dứt bên ngoài:

- Một agent có thể bị tạm dừng hoặc tiếp tục mà không có sự hiểu biết hoặc hợp tác của nó. Ví dụ, điều hướng ra khỏi một window có thể tạm dừng thực thi code nhưng bảo tồn trạng thái của nó. Tuy nhiên, một cụm agent không được phép bị deactivate một phần, để tránh một agent bị chết đói vì một agent khác đã bị deactivate. Ví dụ, shared worker không bao giờ nằm trong cùng một cụm agent với creator window hoặc các dedicated worker khác. Điều này là vì vòng đời của shared worker độc lập với các tài liệu: nếu một tài liệu bị deactivate trong khi dedicated worker của nó giữ một lock, shared worker bị blocked khỏi việc lấy lock cho đến khi dedicated worker được reactivate, nếu bao giờ. Trong khi đó, các worker khác cố gắng truy cập shared worker từ các window khác sẽ bị chết đói.
- Tương tự, một agent có thể bị chấm dứt bởi các yếu tố bên ngoài cụm. Ví dụ, hệ điều hành hoặc người dùng tắt một tiến trình trình duyệt, hoặc trình duyệt buộc chấm dứt một agent vì nó đang sử dụng quá nhiều tài nguyên. Trong trường hợp này, tất cả các agent trong cụm đều bị chấm dứt. (Đặc tả cũng cho phép một chiến lược thứ hai, là một API cho phép ít nhất một thành viên còn lại của cụm xác định việc chấm dứt và agent bị chấm dứt, nhưng điều này không được triển khai trên web.)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Event loops](https://html.spec.whatwg.org/multipage/webappapis.html#event-loops) trong HTML standard
- [What is the Event Loop?](https://nodejs.org/en/learn/asynchronous-work/event-loop-timers-and-nexttick#what-is-the-event-loop) trong tài liệu Node.js
