---
title: JavaScript resource management
slug: Web/JavaScript/Guide/Resource_management
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Iterators_and_generators", "Web/JavaScript/Guide/Internationalization")}}

Hướng dẫn này nói về cách thực hiện _quản lý tài nguyên_ trong JavaScript. Quản lý tài nguyên không hoàn toàn giống với [quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management), đây là một chủ đề nâng cao hơn và thường được JavaScript xử lý tự động. Quản lý tài nguyên là về việc quản lý các tài nguyên _không_ được JavaScript tự động dọn dẹp. Đôi khi, việc có một số đối tượng không sử dụng trong bộ nhớ là chấp nhận được, vì chúng không ảnh hưởng đến logic ứng dụng, nhưng rò rỉ tài nguyên thường dẫn đến các thứ không hoạt động được, hoặc sử dụng quá nhiều bộ nhớ dư thừa. Do đó, đây không phải là tính năng tùy chọn về tối ưu hóa, mà là tính năng cốt lõi để viết các chương trình đúng đắn!

> [!NOTE]
> Mặc dù quản lý bộ nhớ và quản lý tài nguyên là hai chủ đề riêng biệt, đôi khi bạn có thể kết nối vào hệ thống quản lý bộ nhớ để thực hiện quản lý tài nguyên, như là phương sách cuối cùng. Ví dụ, nếu bạn có một đối tượng JavaScript đại diện cho handle của một tài nguyên bên ngoài, bạn có thể tạo một {{jsxref("FinalizationRegistry")}} để dọn dẹp tài nguyên khi handle được thu gom rác, vì chắc chắn không còn cách nào để truy cập tài nguyên đó sau này. Tuy nhiên, không có đảm bảo nào rằng finalizer sẽ chạy, vì vậy không nên dựa vào nó cho các tài nguyên quan trọng.

## Vấn đề

Hãy cùng xem xét một vài ví dụ về các tài nguyên cần được quản lý:

- **File handle**: File handle được dùng để đọc và ghi byte trong một tệp. Khi bạn xong việc với nó, bạn phải gọi [`fileHandle.close()`](https://nodejs.org/api/fs.html#filehandleclose), nếu không tệp sẽ vẫn mở, ngay cả khi đối tượng JS không còn truy cập được nữa. Như tài liệu Node.js đã liên kết cho biết:

  > Nếu một `<FileHandle>` không được đóng bằng phương thức `fileHandle.close()`, nó sẽ cố gắng tự động đóng bộ mô tả tệp và phát ra cảnh báo về process, giúp ngăn rò rỉ bộ nhớ. Vui lòng không dựa vào hành vi này vì nó có thể không đáng tin cậy và tệp có thể không được đóng. Thay vào đó, hãy luôn đóng `<FileHandle>` một cách tường minh. Node.js có thể thay đổi hành vi này trong tương lai.

- **Kết nối mạng**: Một số kết nối, chẳng hạn như {{domxref("WebSocket")}} và {{domxref("RTCPeerConnection")}}, cần được đóng nếu không có tin nhắn nào được truyền. Nếu không, kết nối vẫn mở, và các connection pool thường rất giới hạn về kích thước.
- **Stream reader**: Nếu bạn không gọi {{domxref("ReadableStreamDefaultReader.releaseLock()")}}, stream sẽ bị khóa và không cho phép reader khác sử dụng nó.

Đây là một ví dụ cụ thể, sử dụng readable stream:

```js
const stream = new ReadableStream({
  start(controller) {
    controller.enqueue("a");
    controller.enqueue("b");
    controller.enqueue("c");
    controller.close();
  },
});

async function readUntil(stream, text) {
  const reader = stream.getReader();
  let chunk = await reader.read();

  while (!chunk.done && chunk.value !== text) {
    console.log(chunk);
    chunk = await reader.read();
  }
  // We forgot to release the lock here
}

readUntil(stream, "b").then(() => {
  const anotherReader = stream.getReader();
  // TypeError: ReadableStreamDefaultReader constructor can only
  // accept readable streams that are not yet locked to a reader
});
```

Ở đây, chúng ta có một stream phát ra ba chunk dữ liệu. Chúng ta đọc từ stream cho đến khi tìm thấy chữ "b". Khi `readUntil` trả về, stream mới chỉ được tiêu thụ một phần, vì vậy chúng ta nên có thể tiếp tục đọc từ nó bằng một reader khác. Tuy nhiên, chúng ta quên giải phóng lock, vì vậy mặc dù `reader` không còn khả dụng, stream vẫn bị khóa và chúng ta không thể tạo reader khác.

Giải pháp trong trường hợp này rất đơn giản: gọi `reader.releaseLock()` ở cuối `readUntil`. Nhưng vẫn còn một số vấn đề:

- Không nhất quán: các tài nguyên khác nhau có các cách giải phóng khác nhau. Ví dụ, chúng ta có `close()`, `releaseLock()`, `disconnect()`, v.v. Pattern không được tổng quát hóa.
- Xử lý lỗi: điều gì xảy ra nếu lời gọi `reader.read()` thất bại? Khi đó `readUntil` sẽ kết thúc và không bao giờ đến được lời gọi `reader.releaseLock()`. Chúng ta có thể sửa điều này bằng cách dùng {{jsxref("Statements/try...catch", "try...finally")}}:

  ```js
  async function readUntil(stream, text) {
    const reader = stream.getReader();
    try {
      let chunk = await reader.read();

      while (!chunk.done && chunk.value !== text) {
        console.log(chunk);
        chunk = await reader.read();
      }
    } finally {
      reader.releaseLock();
    }
  }
  ```

  Nhưng bạn phải nhớ làm điều này mỗi khi bạn có một tài nguyên quan trọng cần giải phóng.

- Phạm vi: trong ví dụ trên, `reader` đã bị đóng khi chúng ta thoát khỏi câu lệnh `try...finally`, nhưng nó vẫn tiếp tục khả dụng trong phạm vi của nó. Điều này có nghĩa là bạn có thể vô tình sử dụng nó sau khi nó đã được đóng.
- Nhiều tài nguyên: nếu chúng ta có hai reader trên các stream khác nhau, chúng ta phải nhớ giải phóng cả hai. Đây là một cố gắng đáng kính để làm điều đó:

  ```js
  const reader1 = stream1.getReader();
  const reader2 = stream2.getReader();
  try {
    // do something with reader1 and reader2
  } finally {
    reader1.releaseLock();
    reader2.releaseLock();
  }
  ```

  Tuy nhiên, điều này gây ra nhiều vấn đề xử lý lỗi hơn. Nếu `stream2.getReader()` ném lỗi, thì `reader1` không được giải phóng; nếu `reader1.releaseLock()` ném lỗi, thì `reader2` không được giải phóng. Điều này có nghĩa là chúng ta thực sự phải bọc mỗi cặp thu thập-giải phóng tài nguyên trong `try...finally` riêng của nó:

  ```js
  const reader1 = stream1.getReader();
  try {
    const reader2 = stream2.getReader();
    try {
      // do something with reader1 and reader2
    } finally {
      reader2.releaseLock();
    }
  } finally {
    reader1.releaseLock();
  }
  ```

Bạn thấy cách một nhiệm vụ có vẻ vô hại là gọi `releaseLock` có thể nhanh chóng dẫn đến code lặp lại lồng nhau. Đây là lý do tại sao JavaScript cung cấp hỗ trợ ngôn ngữ tích hợp cho quản lý tài nguyên.

## Khai báo `using` và `await using`

Giải pháp chúng ta có là hai loại khai báo biến đặc biệt: {{jsxref("Statements/using", "using")}} và {{jsxref("Statements/await_using", "await using")}}. Chúng tương tự như `const`, nhưng chúng tự động giải phóng tài nguyên khi biến ra khỏi phạm vi miễn là tài nguyên là _disposable_. Sử dụng ví dụ tương tự như trên, chúng ta có thể viết lại như sau:

```js
{
  using reader1 = stream1.getReader();
  using reader2 = stream2.getReader();

  // do something with reader1 and reader2

  // Before we exit the block, reader1 and reader2 are automatically released
}
```

> [!NOTE]
> Tại thời điểm viết bài này, {{domxref("ReadableStreamDefaultReader")}} chưa triển khai giao thức disposable. Đây là một ví dụ giả định.

Đầu tiên, hãy chú ý dấu ngoặc nhọn thêm xung quanh code. Điều này tạo ra một [block scope](/en-US/docs/Web/JavaScript/Reference/Statements/block) mới cho các khai báo `using`. Các tài nguyên được khai báo với `using` sẽ tự động được giải phóng khi chúng ra khỏi phạm vi của `using`, trong trường hợp này là bất cứ khi nào chúng ta thoát khỏi block, dù vì tất cả các câu lệnh đã được thực thi, hay vì một lỗi hoặc `return`/`break`/`continue` đã gặp phải ở đâu đó.

Điều này có nghĩa là `using` chỉ có thể được sử dụng trong phạm vi có vòng đời rõ ràng—cụ thể là nó không thể được sử dụng ở top-level của một script, vì các biến ở top-level của một script nằm trong phạm vi cho tất cả các script tương lai trên trang, điều này thực tế có nghĩa là tài nguyên không bao giờ có thể được giải phóng nếu trang không bao giờ unload. Tuy nhiên, bạn có thể sử dụng nó ở top-level của một [module](/en-US/docs/Web/JavaScript/Guide/Modules), vì phạm vi module kết thúc khi module hoàn thành việc thực thi.

Bây giờ chúng ta biết _khi nào_ `using` thực hiện dọn dẹp. Nhưng _như thế nào_? `using` yêu cầu tài nguyên phải triển khai giao thức _disposable_. Một đối tượng là disposable nếu nó có phương thức [`[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/dispose). Phương thức này được gọi không có đối số để thực hiện dọn dẹp. Ví dụ, trong trường hợp reader, thuộc tính `[Symbol.dispose]` có thể là một alias hoặc wrapper đơn giản của `releaseLock`:

```js
// For demonstration
class MyReader {
  // A wrapper
  [Symbol.dispose]() {
    this.releaseLock();
  }
  releaseLock() {
    // Logic to release resources
  }
}

// OR, an alias
MyReader.prototype[Symbol.dispose] = MyReader.prototype.releaseLock;
```

Thông qua giao thức disposable, `using` có thể dispose tất cả các tài nguyên theo cách nhất quán mà không cần hiểu loại tài nguyên đó là gì.

Mỗi phạm vi có một danh sách các tài nguyên liên kết với nó, theo thứ tự chúng được khai báo. Khi phạm vi thoát, các tài nguyên được dispose theo thứ tự ngược lại, bằng cách gọi phương thức `[Symbol.dispose]()` của chúng. Ví dụ, trong ví dụ trên, `reader1` được khai báo trước `reader2`, vì vậy `reader2` được dispose trước, sau đó là `reader1`. Các lỗi được ném khi cố gắng dispose một tài nguyên sẽ không ngăn việc dispose các tài nguyên khác. Điều này nhất quán với pattern `try...finally`, và tôn trọng các phụ thuộc có thể có giữa các tài nguyên.

`await using` rất giống với `using`. Cú pháp cho bạn biết rằng một `await` xảy ra ở đâu đó—không phải khi tài nguyên được khai báo, mà thực sự là khi nó được dispose. `await using` yêu cầu tài nguyên phải _async disposable_, có nghĩa là nó có phương thức [`[Symbol.asyncDisposable]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncDispose). Phương thức này được gọi không có đối số và trả về một promise được giải quyết khi quá trình dọn dẹp hoàn tất. Điều này hữu ích khi quá trình dọn dẹp là bất đồng bộ, chẳng hạn như `fileHandle.close()`, trong trường hợp đó kết quả của việc dispose chỉ có thể biết được bất đồng bộ.

```js
{
  await using fileHandle = open("file.txt", "w");
  await fileHandle.write("Hello");

  // fileHandle.close() is called and awaited
}
```

Vì `await using` yêu cầu thực hiện một `await`, nó chỉ được phép trong các ngữ cảnh mà `await` được phép, bao gồm bên trong các hàm `async` và top-level `await` trong các module.

Các tài nguyên được dọn dẹp tuần tự, không phải đồng thời: giá trị trả về của phương thức `[Symbol.asyncDispose]()` của một tài nguyên sẽ được `await` trước khi phương thức `[Symbol.asyncDispose]()` của tài nguyên tiếp theo được gọi.

Một số điều cần lưu ý:

- `using` và `await using` là _opt in_. Nếu bạn khai báo tài nguyên của mình bằng `let`, `const`, hoặc `var`, không có quá trình disposal tự động nào xảy ra, giống như bất kỳ giá trị non-disposable nào khác.
- `using` và `await using` yêu cầu tài nguyên phải disposable (hoặc async disposable). Nếu tài nguyên không có phương thức `[Symbol.dispose]()` hoặc `[Symbol.asyncDispose]()` tương ứng, bạn sẽ nhận được `TypeError` tại dòng khai báo. Tuy nhiên, tài nguyên có thể là `null` hoặc `undefined`, cho phép bạn có thể thu thập tài nguyên có điều kiện.
- Giống như `const`, các biến `using` và `await using` không thể được gán lại, mặc dù các thuộc tính của các đối tượng chúng giữ có thể được thay đổi. Tuy nhiên, phương thức `[Symbol.dispose]()`/`[Symbol.asyncDispose]()` đã được lưu tại thời điểm khai báo, vì vậy việc thay đổi phương thức sau khi khai báo không ảnh hưởng đến quá trình dọn dẹp.
- Có một số lưu ý khi kết hợp phạm vi với vòng đời tài nguyên. Xem [`using`](/en-US/docs/Web/JavaScript/Reference/Statements/using#examples) để biết một vài ví dụ.

## Đối tượng `DisposableStack` và `AsyncDisposableStack`

`using` và `await using` là các cú pháp đặc biệt. Cú pháp rất tiện lợi và ẩn đi nhiều phức tạp, nhưng đôi khi bạn cần làm mọi thứ thủ công.

Một ví dụ phổ biến: điều gì xảy ra nếu bạn không muốn dispose tài nguyên ở cuối phạm vi _này_, mà ở một phạm vi _sau_? Hãy xem xét điều này:

```js
let reader;
if (someCondition) {
  reader = stream.getReader();
} else {
  reader = stream.getReader({ mode: "byob" });
}
```

Như chúng ta đã nói, `using` giống như `const`: nó phải được khởi tạo và không thể được gán lại, vì vậy bạn có thể thử điều này:

```js
if (someCondition) {
  using reader = stream.getReader();
} else {
  using reader = stream.getReader({ mode: "byob" });
}
```

Tuy nhiên, điều này có nghĩa là tất cả logic phải được viết bên trong `if` hoặc `else`, gây ra nhiều code lặp lại. Điều chúng ta muốn làm là thu thập và đăng ký tài nguyên trong một phạm vi nhưng dispose nó trong phạm vi khác. Chúng ta có thể sử dụng {{jsxref("DisposableStack")}} cho mục đích này, đây là một đối tượng giữ một tập hợp các tài nguyên disposable và bản thân nó cũng là disposable:

```js
{
  using disposer = new DisposableStack();
  let reader;
  if (someCondition) {
    reader = disposer.use(stream.getReader());
  } else {
    reader = disposer.use(stream.getReader({ mode: "byob" }));
  }
  // Do something with reader
  // Before scope exit, disposer is disposed, which disposes reader
}
```

Bạn có thể có một tài nguyên chưa triển khai giao thức disposable, vì vậy nó sẽ bị từ chối bởi `using`. Trong trường hợp này, bạn có thể sử dụng {{jsxref("DisposableStack/adopt", "adopt()")}}.

```js
{
  using disposer = new DisposableStack();
  // Suppose reader does not have the [Symbol.dispose]() method,
  // then it cannot be used with using.
  // However, we can manually pass a disposer function to disposer.adopt
  const reader = disposer.adopt(stream.getReader(), (reader) =>
    reader.releaseLock(),
  );
  // Do something with reader
  // Before scope exit, disposer is disposed, which disposes reader
}
```

Bạn có thể có một hành động disposal cần thực hiện nhưng nó không "gắn liền" với bất kỳ tài nguyên cụ thể nào. Có thể bạn chỉ muốn ghi lại một thông báo nói "All database connections closed" khi có nhiều kết nối đang mở đồng thời. Trong trường hợp này, bạn có thể sử dụng {{jsxref("DisposableStack/defer", "defer()")}}.

```js
{
  using disposer = new DisposableStack();
  disposer.defer(() => console.log("All database connections closed"));
  const connection1 = disposer.use(openConnection());
  const connection2 = disposer.use(openConnection());
  // Do something with connection1 and connection2
  // Before scope exit, disposer is disposed, which first disposes connection1
  // and connection2 and then logs the message
}
```

Bạn có thể muốn thực hiện disposal _có điều kiện_—ví dụ, chỉ dispose các tài nguyên đã được yêu cầu khi có lỗi xảy ra. Trong trường hợp này, bạn có thể sử dụng {{jsxref("DisposableStack/move", "move()")}} để bảo tồn các tài nguyên mà nếu không sẽ bị dispose.

```js
class MyResource {
  #resource1;
  #resource2;
  #disposables;
  constructor() {
    using disposer = new DisposableStack();
    this.#resource1 = disposer.use(getResource1());
    this.#resource2 = disposer.use(getResource2());
    // If we made it here, then there were no errors during construction and
    // we can safely move the disposables out of `disposer` and into `#disposables`.
    this.#disposables = disposer.move();
    // If construction failed, then `disposer` would be disposed before reaching
    // the line above, disposing `#resource1` and `#resource2`.
  }
  [Symbol.dispose]() {
    this.#disposables.dispose(); // Dispose `#resource2` and `#resource1`.
  }
}
```

`AsyncDisposableStack` giống như `DisposableStack`, nhưng dùng với các tài nguyên async disposable. Phương thức `use()` của nó nhận một async disposable, phương thức `adopt()` của nó nhận một hàm dọn dẹp async, và phương thức `dispose()` của nó nhận một callback async. Nó cung cấp phương thức `[Symbol.asyncDispose]()`. Bạn vẫn có thể truyền cho nó các tài nguyên đồng bộ nếu bạn có sự kết hợp của cả đồng bộ và bất đồng bộ.

Tham chiếu cho {{jsxref("DisposableStack")}} chứa nhiều ví dụ và chi tiết hơn.

## Xử lý lỗi

Một trường hợp sử dụng chính của tính năng quản lý tài nguyên là để đảm bảo rằng các tài nguyên luôn được dispose, ngay cả khi có lỗi xảy ra. Hãy cùng điều tra một số tình huống xử lý lỗi phức tạp.

Chúng ta bắt đầu với code sau, vốn, bằng cách sử dụng `using`, đã vững chắc trước các lỗi:

```js
async function readUntil(stream, text) {
  // Use `using` instead of `await using` because `releaseLock` is synchronous
  using reader = stream.getReader();
  let chunk = await reader.read();

  while (!chunk.done && chunk.value !== text) {
    console.log(chunk.toUpperCase());
    chunk = await reader.read();
  }
}
```

Giả sử `chunk` hóa ra là `null`. Khi đó `!chunk.done` sẽ ném một `TypeError`, khiến hàm kết thúc. Trước khi hàm thoát, `stream[Symbol.dispose]()` được gọi, giải phóng lock trên stream.

```js
const stream = new ReadableStream({
  start(controller) {
    controller.enqueue("a");
    controller.enqueue(null);
    controller.enqueue("b");
    controller.enqueue("c");
    controller.close();
  },
});

readUntil(stream, "b")
  .catch((e) => console.error(e)) // TypeError: chunk.toUpperCase is not a function
  .then(() => {
    const anotherReader = stream.getReader();
    // Successfully creates another reader
  });
```

Vì vậy, `using` không nuốt bất kỳ lỗi nào: tất cả các lỗi xảy ra vẫn được ném, nhưng các tài nguyên được đóng ngay trước đó. Bây giờ, điều gì xảy ra nếu chính quá trình dọn dẹp tài nguyên cũng ném lỗi? Hãy sử dụng một ví dụ phức tạp hơn:

```js
class MyReader {
  [Symbol.dispose]() {
    throw new Error("Failed to release lock");
  }
}

function doSomething() {
  using reader = new MyReader();
  throw new Error("Failed to read");
}

try {
  doSomething();
} catch (e) {
  console.error(e); // SuppressedError: An error was suppressed during disposal
}
```

Có hai lỗi được tạo ra trong lời gọi `doSomething()`: một lỗi được ném trong `doSomething`, và một lỗi được ném trong quá trình dispose `reader` do lỗi đầu tiên. Cả hai lỗi đều được ném cùng nhau, vì vậy những gì bạn bắt được là một {{jsxref("SuppressedError")}}. Đây là một lỗi đặc biệt bao bọc hai lỗi: thuộc tính {{jsxref("SuppressedError/error", "error")}} chứa lỗi sau này, và thuộc tính {{jsxref("SuppressedError/suppressed", "suppressed")}} chứa lỗi trước đó, bị "triệt tiêu" bởi lỗi sau này.

Nếu chúng ta có nhiều hơn một tài nguyên, và _cả hai_ trong số chúng đều ném lỗi trong quá trình dispose (điều này cực kỳ hiếm—việc dispose thất bại đã là hiếm rồi!), thì mỗi lỗi trước đó bị triệt tiêu bởi lỗi sau này, tạo thành một chuỗi các lỗi bị triệt tiêu.

```js
class MyReader {
  [Symbol.dispose]() {
    throw new Error("Failed to release lock on reader");
  }
}

class MyWriter {
  [Symbol.dispose]() {
    throw new Error("Failed to release lock on writer");
  }
}

function doSomething() {
  using reader = new MyReader();
  using writer = new MyWriter();
  throw new Error("Failed to read");
}

try {
  doSomething();
} catch (e) {
  console.error(e); // SuppressedError: An error was suppressed during disposal
  console.error(e.suppressed); // SuppressedError: An error was suppressed during disposal
  console.error(e.error); // Error: Failed to release lock on reader
  console.error(e.suppressed.suppressed); // Error: Failed to read
  console.error(e.suppressed.error); // Error: Failed to release lock on writer
}
```

- `reader` được giải phóng sau cùng, vì vậy lỗi của nó là mới nhất và do đó triệt tiêu tất cả mọi thứ khác: nó xuất hiện là `e.error`.
- `writer` được giải phóng trước, vì vậy lỗi của nó xảy ra sau lỗi thoát ban đầu, nhưng trước lỗi của `reader`: nó xuất hiện là `e.suppressed.error`.
- Lỗi ban đầu về "Failed to read" là lỗi sớm nhất, vì vậy nó xuất hiện là `e.suppressed.suppressed`.

## Ví dụ

### Tự động giải phóng object URL

Trong ví dụ sau, chúng ta tạo một [object URL](/en-US/docs/Web/URI/Reference/Schemes/blob) đến một blob (trong ứng dụng thực tế, blob này sẽ được lấy từ đâu đó, chẳng hạn như một tệp hoặc phản hồi fetch) để chúng ta có thể tải xuống blob dưới dạng một tệp. Để ngăn rò rỉ tài nguyên, chúng ta phải giải phóng object URL bằng {{domxref("URL/revokeObjectURL_static", "URL.revokeObjectURL()")}} khi nó không còn cần thiết (tức là khi tải xuống đã bắt đầu thành công). Vì URL bản thân chỉ là một chuỗi và do đó không triển khai giao thức disposable, chúng ta không thể khai báo `url` trực tiếp với `using`; vì vậy, chúng ta tạo một `DisposableStack` để đóng vai trò là disposer cho `url`. Object URL được thu hồi ngay khi `disposer` ra khỏi phạm vi, tức là khi `link.click()` hoàn thành hoặc khi có lỗi xảy ra ở đâu đó.

```js
const downloadButton = document.getElementById("download-button");
const exampleBlob = new Blob(["example data"]);

downloadButton.addEventListener("click", () => {
  using disposer = new DisposableStack();
  const link = document.createElement("a");
  const url = disposer.adopt(
    URL.createObjectURL(exampleBlob),
    URL.revokeObjectURL,
  );

  link.href = url;
  link.download = "example.txt";
  link.click();
});
```

### Tự động hủy các yêu cầu đang xử lý

Trong ví dụ sau, chúng ta [fetch](/en-US/docs/Web/API/Window/fetch) một danh sách tài nguyên đồng thời sử dụng {{jsxref("Promise.all()")}}. `Promise.all()` thất bại và từ chối promise kết quả ngay khi một yêu cầu thất bại; tuy nhiên, các yêu cầu đang chờ xử lý khác tiếp tục chạy, mặc dù kết quả của chúng không thể truy cập được bởi chương trình. Để tránh các yêu cầu còn lại này tiêu tốn tài nguyên một cách không cần thiết, chúng ta cần tự động hủy các yêu cầu đang xử lý bất cứ khi nào `Promise.all()` kết thúc. Chúng ta triển khai hủy bỏ bằng {{domxref("AbortController")}}, và truyền {{domxref("AbortController/signal", "signal")}} của nó đến mỗi lời gọi `fetch()`. Nếu `Promise.all()` thực hiện thành công, thì hàm trả về bình thường và controller hủy bỏ, điều này là vô hại vì không có yêu cầu nào đang chờ xử lý để hủy; nếu `Promise.all()` từ chối và hàm ném lỗi, thì controller hủy bỏ và hủy tất cả các yêu cầu đang chờ xử lý.

```js
async function getAllData(urls) {
  using disposer = new DisposableStack();
  const { signal } = disposer.adopt(new AbortController(), (controller) =>
    controller.abort(),
  );

  // Fetch all URLs in parallel
  // Automatically cancel any incomplete requests if any request fails
  const pages = await Promise.all(
    urls.map((url) =>
      fetch(url, { signal }).then((response) => {
        if (!response.ok)
          throw new Error(
            `Response error: ${response.status} - ${response.statusText}`,
          );
        return response.text();
      }),
    ),
  );
  return pages;
}
```

## Cạm bẫy

Cú pháp disposal tài nguyên cung cấp nhiều đảm bảo xử lý lỗi mạnh mẽ đảm bảo rằng các tài nguyên luôn được dọn dẹp dù điều gì xảy ra, nhưng vẫn có một số cạm bẫy bạn có thể gặp phải:

- Quên sử dụng `using` hoặc `await using`. Cú pháp quản lý tài nguyên chỉ ở đó để giúp bạn khi bạn biết mình cần nó, nhưng không có gì để nhắc nhở bạn nếu bạn quên sử dụng nó! Thật không may, không có cách nào tốt để ngăn điều này trước khi xảy ra, vì không có dấu hiệu cú pháp nào cho biết điều gì đó là tài nguyên disposable, và ngay cả đối với các tài nguyên disposable, bạn có thể muốn khai báo chúng mà không cần disposal tự động. Bạn có thể cần một type checker kết hợp với một linter để bắt các vấn đề này, chẳng hạn như [typescript-eslint](https://typescript-eslint.io/) ([vẫn đang lên kế hoạch làm việc với tính năng này](https://github.com/typescript-eslint/typescript-eslint/issues/8255)).
- Sử dụng sau khi giải phóng. Nhìn chung, cú pháp `using` đảm bảo rằng một tài nguyên được giải phóng khi nó ra khỏi phạm vi, nhưng có nhiều cách để duy trì một giá trị vượt qua biến liên kết của nó. JavaScript không có cơ chế sở hữu như Rust, vì vậy bạn có thể khai báo một alias không sử dụng `using`, hoặc bảo tồn tài nguyên trong một [closure](/en-US/docs/Web/JavaScript/Guide/Closures), v.v. Tham chiếu {{jsxref("Statements/using", "using")}} chứa nhiều ví dụ về các cạm bẫy như vậy. Một lần nữa, không có cách nào tốt để phát hiện điều này một cách chính xác trong luồng điều khiển phức tạp, vì vậy bạn cần phải cẩn thận.

Tính năng quản lý tài nguyên không phải là một giải pháp toàn năng. Nó chắc chắn là một cải tiến so với việc gọi thủ công các phương thức disposal, nhưng nó không đủ thông minh để ngăn tất cả các lỗi quản lý tài nguyên. Bạn vẫn cần phải cẩn thận và hiểu ngữ nghĩa của các tài nguyên bạn đang sử dụng.

## Kết luận

Dưới đây là các thành phần chính của hệ thống quản lý tài nguyên:

- Các khai báo {{jsxref("Statements/using", "using")}} và {{jsxref("Statements/await_using", "await using")}} để disposal tài nguyên tự động.
- Các giao thức _disposable_ và _async disposable_, sử dụng {{jsxref("Symbol.dispose")}} và {{jsxref("Symbol.asyncDispose")}} tương ứng, để các tài nguyên triển khai.
- Các đối tượng {{jsxref("DisposableStack")}} và {{jsxref("AsyncDisposableStack")}} cho các trường hợp mà `using` và `await using` không phù hợp.

Với việc sử dụng đúng đắn các API này, bạn có thể tạo ra các hệ thống tương tác với các tài nguyên bên ngoài mà vẫn mạnh mẽ và vững chắc trước tất cả các điều kiện lỗi mà không cần nhiều code lặp lại.

{{PreviousNext("Web/JavaScript/Guide/Iterators_and_generators", "Web/JavaScript/Guide/Internationalization")}}
