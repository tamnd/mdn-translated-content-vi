---
title: Cách sử dụng Promise
short-title: Sử dụng Promise
slug: Learn_web_development/Extensions/Async_JS/Promises
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Introducing", "Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API", "Learn_web_development/Extensions/Async_JS")}}

**Promise** là nền tảng của lập trình bất đồng bộ trong JavaScript hiện đại. Promise là một đối tượng được trả về bởi một hàm bất đồng bộ, đại diện cho trạng thái hiện tại của thao tác. Tại thời điểm Promise được trả về cho người gọi, thao tác thường chưa kết thúc, nhưng đối tượng Promise cung cấp các phương thức để xử lý sự thành công hoặc thất bại cuối cùng của thao tác.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
         Hiểu biết vững chắc về <a href="/en-US/docs/Learn_web_development/Core/Scripting">các kiến thức cơ bản về JavaScript</a> và các khái niệm bất đồng bộ, được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các khái niệm và kiến thức cơ bản về sử dụng Promise trong JavaScript.</li>
          <li>Xâu chuỗi và kết hợp các Promise.</li>
          <li>Xử lý lỗi trong các Promise.</li>
          <li><code>async</code> và <code>await</code>: cách chúng liên quan đến Promise, và tại sao chúng hữu ích.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Trong [bài viết trước](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing), chúng ta đã nói về việc sử dụng hàm gọi lại để triển khai các hàm bất đồng bộ. Với thiết kế đó, bạn gọi hàm bất đồng bộ, truyền vào hàm gọi lại của mình. Hàm trả về ngay lập tức và gọi hàm gọi lại của bạn khi thao tác kết thúc.

Với API dựa trên Promise, hàm bất đồng bộ bắt đầu thao tác và trả về đối tượng {{jsxref("Promise")}}. Sau đó bạn có thể gắn các trình xử lý vào đối tượng Promise này, và các trình xử lý này sẽ được thực thi khi thao tác thành công hoặc thất bại.

## Sử dụng API fetch()

> [!NOTE]
> Trong bài viết này, chúng ta sẽ khám phá Promise bằng cách sao chép các mẫu code từ trang vào bảng điều khiển JavaScript của trình duyệt. Để thiết lập điều này:
>
> 1. mở tab trình duyệt và truy cập <https://example.org>
> 2. trong tab đó, mở bảng điều khiển JavaScript trong [công cụ phát triển của trình duyệt](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools)
> 3. khi chúng ta hiển thị một ví dụ, hãy sao chép nó vào bảng điều khiển. Bạn sẽ phải tải lại trang mỗi lần bạn nhập một ví dụ mới, hoặc bảng điều khiển sẽ phàn nàn rằng bạn đã khai báo lại `fetchPromise`.

Trong ví dụ này, chúng ta sẽ tải xuống tệp JSON từ <https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json>, và ghi một số thông tin về nó.

Để làm điều này, chúng ta sẽ thực hiện một **yêu cầu HTTP** đến máy chủ. Trong một yêu cầu HTTP, chúng ta gửi một thông báo yêu cầu đến máy chủ từ xa, và nó gửi lại cho chúng ta một phản hồi. Trong trường hợp này, chúng ta sẽ gửi yêu cầu để lấy tệp JSON từ máy chủ. Nhớ lại bài viết trước, nơi chúng ta thực hiện các yêu cầu HTTP bằng API {{domxref("XMLHttpRequest")}}? Trong bài viết này, chúng ta sẽ sử dụng API {{domxref("Window/fetch", "fetch()")}}, là sự thay thế hiện đại dựa trên Promise cho `XMLHttpRequest`.

Hãy sao chép đoạn này vào bảng điều khiển JavaScript của trình duyệt:

```js
const fetchPromise = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);

console.log(fetchPromise);

fetchPromise.then((response) => {
  console.log(`Received response: ${response.status}`);
});

console.log("Started request…");
```

Ở đây chúng ta:

1. gọi API `fetch()`, và gán giá trị trả về cho biến `fetchPromise`
2. ngay sau đó, ghi biến `fetchPromise`. Điều này nên xuất ra điều gì đó như: `Promise { <state>: "pending" }`, cho chúng ta biết rằng chúng ta có một đối tượng `Promise`, và nó có `state` có giá trị là `"pending"`. Trạng thái `"pending"` có nghĩa là thao tác fetch vẫn đang diễn ra.
3. truyền hàm xử lý vào phương thức **`then()`** của Promise. Khi (và nếu) thao tác fetch thành công, Promise sẽ gọi trình xử lý của chúng ta, truyền vào đối tượng {{domxref("Response")}}, chứa phản hồi của máy chủ.
4. ghi thông báo rằng chúng ta đã bắt đầu yêu cầu.

Đầu ra hoàn chỉnh phải là điều gì đó như:

```plain
Promise { <state>: "pending" }
Started request…
Received response: 200
```

Lưu ý rằng `Started request…` được ghi trước khi chúng ta nhận được phản hồi. Không giống như hàm đồng bộ, `fetch()` trả về trong khi yêu cầu vẫn đang diễn ra, cho phép chương trình của chúng ta tiếp tục đáp ứng. Phản hồi cho thấy mã trạng thái `200` (OK), nghĩa là yêu cầu của chúng ta đã thành công.

Điều này có thể trông giống ví dụ trong bài viết trước, nơi chúng ta thêm trình xử lý sự kiện vào đối tượng {{domxref("XMLHttpRequest")}}. Thay vì đó, chúng ta đang truyền trình xử lý vào phương thức `then()` của Promise được trả về.

## Xâu chuỗi Promise

Với API `fetch()`, khi bạn có đối tượng `Response`, bạn cần gọi một hàm khác để lấy dữ liệu phản hồi. Trong trường hợp này, chúng ta muốn lấy dữ liệu phản hồi dưới dạng JSON, vì vậy chúng ta sẽ gọi phương thức {{domxref("Response/json", "json()")}} của đối tượng `Response`. Hóa ra `json()` cũng là bất đồng bộ. Vì vậy đây là trường hợp chúng ta phải gọi hai hàm bất đồng bộ liên tiếp.

Hãy thử điều này:

```js
const fetchPromise = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);

fetchPromise.then((response) => {
  const jsonPromise = response.json();
  jsonPromise.then((data) => {
    console.log(data[0].name);
  });
});
```

Trong ví dụ này, như trước, chúng ta thêm trình xử lý `then()` vào Promise được trả về bởi `fetch()`. Nhưng lần này, trình xử lý của chúng ta gọi `response.json()`, và sau đó truyền một trình xử lý `then()` mới vào Promise được trả về bởi `response.json()`.

Điều này phải ghi "baked beans" (tên sản phẩm đầu tiên được liệt kê trong "products.json").

Nhưng đợi đã! Nhớ bài viết trước, nơi chúng ta nói rằng bằng cách gọi hàm gọi lại bên trong một hàm gọi lại khác, chúng ta đã nhận được các cấp lồng nhau ngày càng nhiều? Và chúng ta nói rằng "callback hell" này làm cho code của chúng ta khó hiểu? Đây chẳng phải là điều tương tự, chỉ với lời gọi `then()`?

Đúng vậy. Nhưng tính năng thanh lịch của Promise là `then()` bản thân trả về một Promise mới được hoàn thành với giá trị trả về của hàm gọi lại (nếu hàm chạy thành công). Điều này có nghĩa là chúng ta có thể (và chắc chắn nên) viết lại code trên như sau:

```js
const fetchPromise = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);

fetchPromise
  .then((response) => response.json())
  .then((data) => {
    console.log(data[0].name);
  });
```

Thay vì gọi `then()` thứ hai bên trong trình xử lý cho `then()` đầu tiên, chúng ta có thể _trả về_ Promise được trả về bởi `json()`, và gọi `then()` thứ hai trên giá trị trả về đó. Điều này được gọi là **xâu chuỗi Promise** và có nghĩa là chúng ta có thể tránh các cấp thụt lề ngày càng tăng khi chúng ta cần thực hiện các lời gọi hàm bất đồng bộ liên tiếp.

Trước khi chuyển sang bước tiếp theo, còn một phần nữa cần thêm. Chúng ta cần kiểm tra xem máy chủ có chấp nhận và có thể xử lý yêu cầu không, trước khi chúng ta cố gắng đọc nó. Chúng ta sẽ làm điều này bằng cách kiểm tra mã trạng thái trong phản hồi và ném lỗi nếu nó không phải "OK":

```js
const fetchPromise = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);

fetchPromise
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    console.log(data[0].name);
  });
```

## Bắt lỗi

Điều này đưa chúng ta đến phần cuối cùng: làm thế nào để chúng ta xử lý lỗi? API `fetch()` có thể ném ra lỗi vì nhiều lý do (ví dụ, vì không có kết nối mạng hoặc URL bị định dạng sai theo cách nào đó) và chúng ta đang tự ném lỗi nếu máy chủ trả về lỗi.

Trong bài viết trước, chúng ta đã thấy rằng xử lý lỗi có thể rất khó khăn với các hàm gọi lại lồng nhau, buộc chúng ta phải xử lý lỗi ở mỗi cấp lồng nhau.

Để hỗ trợ xử lý lỗi, các đối tượng `Promise` cung cấp phương thức {{jsxref("Promise/catch", "catch()")}}. Phương thức này rất giống `then()`: bạn gọi nó và truyền vào một hàm xử lý. Tuy nhiên, trong khi trình xử lý được truyền vào `then()` được gọi khi thao tác bất đồng bộ _thành công_, thì trình xử lý được truyền vào `catch()` được gọi khi thao tác bất đồng bộ _thất bại_.

Nếu bạn thêm `catch()` vào cuối chuỗi Promise, thì nó sẽ được gọi khi bất kỳ lời gọi hàm bất đồng bộ nào thất bại. Vì vậy bạn có thể triển khai một thao tác như nhiều lời gọi hàm bất đồng bộ liên tiếp, và có một nơi duy nhất để xử lý tất cả các lỗi.

Hãy thử phiên bản này của code `fetch()` của chúng ta. Chúng ta đã thêm trình xử lý lỗi bằng cách sử dụng `catch()`, và cũng đã sửa đổi URL để yêu cầu sẽ thất bại.

```js
const fetchPromise = fetch(
  "bad-scheme://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);

fetchPromise
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    console.log(data[0].name);
  })
  .catch((error) => {
    console.error(`Could not get products: ${error}`);
  });
```

Hãy thử chạy phiên bản này: bạn sẽ thấy lỗi được ghi bởi trình xử lý `catch()` của chúng ta.

## Thuật ngữ Promise

Promise đi kèm với một số thuật ngữ khá cụ thể mà đáng để làm rõ.

Đầu tiên, một Promise có thể ở một trong ba trạng thái:

- **pending** (đang chờ): Trạng thái ban đầu. Thao tác chưa hoàn thành (thành công hoặc thất bại).
- **fulfilled** (đã hoàn thành): Thao tác thành công. Đây là khi trình xử lý `.then()` của Promise được gọi.
- **rejected** (đã bị từ chối): Thao tác thất bại. Đây là khi trình xử lý `.catch()` của Promise được gọi.

Lưu ý rằng "thành công" hoặc "thất bại" ở đây có nghĩa là gì phụ thuộc vào API được đề cập. Ví dụ, `fetch()` từ chối Promise được trả về nếu (trong số các lý do khác) lỗi mạng ngăn yêu cầu được gửi, nhưng hoàn thành Promise nếu máy chủ gửi phản hồi, ngay cả khi phản hồi là lỗi như [404 Not Found](/en-US/docs/Web/HTTP/Reference/Status/404).

Chúng ta cũng sử dụng một số thuật ngữ khác để mô tả trạng thái của Promise:

- **completed** (đã xong): Promise không còn đang chờ nữa; nó đã được hoàn thành hoặc bị từ chối.
- **resolved** (đã giải quyết): Promise đã hoàn thành, hoặc nó đã "bị khóa vào" để tuân theo trạng thái của một Promise khác. Đây là một khái niệm nâng cao hơn, liên quan khi một Promise phụ thuộc vào Promise khác.

Bài viết [Let's talk about how to talk about promises](https://thenewtoys.dev/blog/2021/02/08/lets-talk-about-how-to-talk-about-promises/) cung cấp một giải thích tuyệt vời về chi tiết của thuật ngữ này.

## Kết hợp nhiều Promise

Chuỗi Promise là những gì bạn cần khi thao tác của bạn bao gồm nhiều hàm bất đồng bộ, và bạn cần mỗi hàm hoàn thành trước khi bắt đầu cái tiếp theo. Nhưng có những cách khác mà bạn có thể cần kết hợp các lời gọi hàm bất đồng bộ, và API `Promise` cung cấp một số helper cho chúng.

Đôi khi, bạn cần tất cả các Promise được hoàn thành, nhưng chúng không phụ thuộc vào nhau. Trong trường hợp đó, việc bắt đầu tất cả cùng một lúc và sau đó được thông báo khi tất cả đã hoàn thành sẽ hiệu quả hơn nhiều. Phương thức {{jsxref("Promise/all", "Promise.all()")}} là những gì bạn cần ở đây. Nó nhận một mảng các Promise và trả về một Promise duy nhất.

Promise được trả về bởi `Promise.all()` là:

- hoàn thành khi và nếu _tất cả_ các Promise trong mảng được hoàn thành. Trong trường hợp này, trình xử lý `then()` được gọi với một mảng tất cả các phản hồi, theo cùng thứ tự các Promise được truyền vào `all()`.
- bị từ chối khi và nếu _bất kỳ_ Promise nào trong mảng bị từ chối. Trong trường hợp này, trình xử lý `catch()` được gọi với lỗi được ném ra bởi Promise đã bị từ chối.

Ví dụ:

```js
const fetchPromise1 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);
const fetchPromise2 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/not-found",
);
const fetchPromise3 = fetch(
  "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json",
);

Promise.all([fetchPromise1, fetchPromise2, fetchPromise3])
  .then((responses) => {
    for (const response of responses) {
      console.log(`${response.url}: ${response.status}`);
    }
  })
  .catch((error) => {
    console.error(`Failed to fetch: ${error}`);
  });
```

Ở đây, chúng ta đang thực hiện ba yêu cầu `fetch()` đến ba URL khác nhau. Nếu tất cả thành công, chúng ta sẽ ghi mã trạng thái phản hồi của mỗi cái. Nếu bất kỳ cái nào thất bại, thì chúng ta ghi lỗi.

Với các URL chúng ta đã cung cấp, tất cả các yêu cầu phải được hoàn thành, mặc dù đối với cái thứ hai, máy chủ sẽ trả về `404` (Not Found) thay vì `200` (OK) vì tệp được yêu cầu không tồn tại. Vì vậy đầu ra phải là:

```plain
https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json: 200
https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/not-found: 404
https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json: 200
```

Nếu chúng ta thử cùng code với URL bị định dạng sai, như sau:

```js
const fetchPromise1 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);
const fetchPromise2 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/not-found",
);
const fetchPromise3 = fetch(
  "bad-scheme://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json",
);

Promise.all([fetchPromise1, fetchPromise2, fetchPromise3])
  .then((responses) => {
    for (const response of responses) {
      console.log(`${response.url}: ${response.status}`);
    }
  })
  .catch((error) => {
    console.error(`Failed to fetch: ${error}`);
  });
```

Thì chúng ta có thể kỳ vọng trình xử lý `catch()` chạy, và chúng ta sẽ thấy điều gì đó như:

```plain
Failed to fetch: TypeError: Failed to fetch
```

Đôi khi, bạn có thể cần bất kỳ một trong một tập hợp Promise được hoàn thành, và không quan tâm cái nào. Trong trường hợp đó, bạn muốn {{jsxref("Promise/any", "Promise.any()")}}. Cái này giống như `Promise.all()`, ngoại trừ nó được hoàn thành ngay khi bất kỳ Promise nào trong mảng được hoàn thành, hoặc bị từ chối nếu tất cả chúng bị từ chối:

```js
const fetchPromise1 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
);
const fetchPromise2 = fetch(
  "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/not-found",
);
const fetchPromise3 = fetch(
  "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json",
);

Promise.any([fetchPromise1, fetchPromise2, fetchPromise3])
  .then((response) => {
    console.log(`${response.url}: ${response.status}`);
  })
  .catch((error) => {
    console.error(`Failed to fetch: ${error}`);
  });
```

Lưu ý rằng trong trường hợp này, chúng ta không thể dự đoán yêu cầu fetch nào sẽ hoàn thành trước.

Đây chỉ là hai hàm `Promise` bổ sung để kết hợp nhiều Promise. Để tìm hiểu về các hàm còn lại, hãy xem tài liệu tham khảo {{jsxref("Promise")}}.

## async và await

Từ khóa {{jsxref("Statements/async_function", "async")}} cung cấp cho bạn một cách đơn giản hơn để làm việc với code dựa trên Promise bất đồng bộ. Thêm `async` vào đầu hàm làm cho nó trở thành hàm async:

```js
async function myFunction() {
  // This is an async function
}
```

Bên trong một hàm async, bạn có thể sử dụng từ khóa `await` trước lời gọi đến hàm trả về Promise. Điều này làm cho code chờ tại điểm đó cho đến khi Promise được giải quyết, tại đó giá trị đã hoàn thành của Promise được coi là giá trị trả về, hoặc giá trị bị từ chối được ném ra.

Điều này cho phép bạn viết code sử dụng các hàm bất đồng bộ nhưng trông giống như code đồng bộ. Ví dụ, chúng ta có thể sử dụng nó để viết lại ví dụ fetch của chúng ta:

```js
async function fetchProducts() {
  try {
    // after this line, our function will wait for the `fetch()` call to be settled
    // the `fetch()` call will either return a Response or throw an error
    const response = await fetch(
      "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
    );
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    // after this line, our function will wait for the `response.json()` call to be settled
    // the `response.json()` call will either return the parsed JSON object or throw an error
    const data = await response.json();
    console.log(data[0].name);
  } catch (error) {
    console.error(`Could not get products: ${error}`);
  }
}

fetchProducts();
```

Ở đây, chúng ta đang gọi `await fetch()`, và thay vì nhận một `Promise`, người gọi của chúng ta nhận lại một đối tượng `Response` hoàn chỉnh, giống như khi `fetch()` là một hàm đồng bộ!

Chúng ta thậm chí có thể sử dụng khối `try...catch` để xử lý lỗi, giống như chúng ta sẽ làm nếu code là đồng bộ.

Tuy nhiên hãy lưu ý rằng các hàm async luôn trả về một Promise, vì vậy bạn không thể làm điều gì đó như:

```js example-bad
async function fetchProducts() {
  try {
    const response = await fetch(
      "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
    );
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(`Could not get products: ${error}`);
  }
}

const promise = fetchProducts();
console.log(promise[0].name); // "promise" is a Promise object, so this will not work
```

Thay vào đó, bạn cần làm điều gì đó như:

```js
async function fetchProducts() {
  const response = await fetch(
    "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
  );
  if (!response.ok) {
    throw new Error(`HTTP error: ${response.status}`);
  }
  const data = await response.json();
  return data;
}

const promise = fetchProducts();
promise
  .then((data) => {
    console.log(data[0].name);
  })
  .catch((error) => {
    console.error(`Could not get products: ${error}`);
  });
```

Ở đây, chúng ta đã chuyển `try...catch` trở lại trình xử lý `catch` trên Promise được trả về. Điều này có nghĩa là trình xử lý `then` của chúng ta không phải xử lý trường hợp lỗi bị bắt bên trong hàm `fetchProducts`, gây ra việc `data` là `undefined`. Xử lý lỗi như bước cuối cùng của chuỗi Promise.

Ngoài ra, hãy lưu ý rằng bạn chỉ có thể sử dụng `await` bên trong hàm `async`, trừ khi code của bạn nằm trong [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules). Điều đó có nghĩa là bạn không thể làm điều này trong một script bình thường:

```js
try {
  // using await outside an async function is only allowed in a module
  const response = await fetch(
    "https://mdn.github.io/learning-area/javascript/apis/fetching-data/can-store/products.json",
  );
  if (!response.ok) {
    throw new Error(`HTTP error: ${response.status}`);
  }
  const data = await response.json();
  console.log(data[0].name);
} catch (error) {
  console.error(`Could not get products: ${error}`);
  throw error;
}
```

Bạn có thể sẽ sử dụng các hàm `async` nhiều nơi mà bạn có thể sử dụng chuỗi Promise, và chúng làm cho việc làm việc với Promise trực quan hơn nhiều.

Hãy nhớ rằng giống như chuỗi Promise, `await` buộc các thao tác bất đồng bộ được hoàn thành theo thứ tự. Điều này là cần thiết nếu kết quả của thao tác tiếp theo phụ thuộc vào kết quả của thao tác cuối cùng, nhưng nếu không phải vậy thì điều gì đó như `Promise.all()` sẽ hiệu quả hơn.

## Tóm tắt

Promise là nền tảng của lập trình bất đồng bộ trong JavaScript hiện đại. Chúng làm cho việc biểu đạt và lý luận về các chuỗi thao tác bất đồng bộ dễ dàng hơn mà không cần các hàm gọi lại được lồng sâu, và chúng hỗ trợ kiểu xử lý lỗi tương tự như câu lệnh `try...catch` đồng bộ.

Các từ khóa `async` và `await` giúp xây dựng thao tác từ một loạt các lời gọi hàm bất đồng bộ liên tiếp dễ dàng hơn, tránh nhu cầu tạo chuỗi Promise tường minh, và cho phép bạn viết code trông giống như code đồng bộ.

Promise hoạt động trong các phiên bản mới nhất của tất cả các trình duyệt hiện đại; nơi duy nhất hỗ trợ Promise sẽ là vấn đề là Opera Mini và IE11 và các phiên bản cũ hơn.

Chúng ta không đề cập đến tất cả các tính năng của Promise trong bài viết này, chỉ những tính năng thú vị và hữu ích nhất. Khi bạn bắt đầu tìm hiểu thêm về Promise, bạn sẽ gặp nhiều tính năng và kỹ thuật hơn.

Nhiều API Web hiện đại dựa trên Promise, bao gồm [WebRTC](/en-US/docs/Web/API/WebRTC_API), [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API), và nhiều hơn nữa.

## Xem thêm

- [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [Sử dụng Promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [We have a problem with promises](https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html) của Nolan Lawson
- [Let's talk about how to talk about promises](https://thenewtoys.dev/blog/2021/02/08/lets-talk-about-how-to-talk-about-promises/)

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Introducing", "Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API", "Learn_web_development/Extensions/Async_JS")}}
