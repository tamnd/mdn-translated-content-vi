---
title: "Hướng dẫn Express Phần 4: Tuyến đường và bộ điều khiển"
short-title: "4: Routes and controllers"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/routes
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose", "Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Trong hướng dẫn này, chúng tôi sẽ thiết lập các tuyến đường (mã xử lý URL) với các hàm xử lý "giả" cho tất cả các điểm cuối tài nguyên mà cuối cùng chúng tôi sẽ cần trong trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website). Khi hoàn thành, chúng tôi sẽ có cấu trúc mô-đun cho mã xử lý tuyến đường, mà chúng tôi có thể mở rộng với các hàm xử lý thực trong các bài viết sau. Chúng tôi cũng sẽ có hiểu biết rất tốt về cách tạo tuyến đường mô-đun bằng Express!

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Đọc <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction">Giới thiệu Express/Node</a>.
        Hoàn thành các chủ đề hướng dẫn trước (bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose">Hướng dẫn Express Phần 3: Sử dụng Cơ sở dữ liệu (với Mongoose)</a>).
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để hiểu cách tạo các tuyến đường đơn giản.
        Để thiết lập tất cả các điểm cuối URL của chúng tôi.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Trong [bài viết hướng dẫn trước](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose), chúng tôi đã định nghĩa các mô hình _Mongoose_ để tương tác với cơ sở dữ liệu và sử dụng script (độc lập) để tạo một số bản ghi thư viện ban đầu. Bây giờ chúng tôi có thể viết mã để trình bày thông tin đó cho người dùng. Điều đầu tiên chúng tôi cần làm là xác định thông tin nào chúng tôi muốn có thể hiển thị trong các trang của mình và sau đó định nghĩa các URL phù hợp để trả về các tài nguyên đó. Sau đó chúng tôi sẽ cần tạo các tuyến đường (trình xử lý URL) và các views (mẫu) để hiển thị những trang đó.

Sơ đồ bên dưới được cung cấp như một nhắc nhở về luồng dữ liệu chính và những thứ cần triển khai khi xử lý yêu cầu/phản hồi HTTP. Ngoài các views và tuyến đường, sơ đồ hiển thị "bộ điều khiển" — các hàm tách ra mã để định tuyến yêu cầu khỏi mã thực sự xử lý yêu cầu.

Vì chúng tôi đã tạo các mô hình, những thứ chính chúng tôi sẽ cần tạo là:

- "Tuyến đường" để chuyển tiếp các yêu cầu được hỗ trợ (và bất kỳ thông tin nào được mã hóa trong URL yêu cầu) đến các hàm bộ điều khiển phù hợp.
- Các hàm bộ điều khiển để lấy dữ liệu được yêu cầu từ các mô hình, tạo trang HTML hiển thị dữ liệu và trả về nó cho người dùng để xem trong trình duyệt.
- Views (mẫu) được sử dụng bởi các bộ điều khiển để render dữ liệu.

![Main data flow diagram of an MVC express server: 'Routes' receive the HTTP requests sent to the Express server and forward them to the appropriate 'controller' function. The controller reads and writes data from the models. Models are connected to the database to provide data access to the server. Controllers use 'views', also called templates, to render the data. The Controller sends the HTML HTTP response back to the client as an HTTP response.](mvc_express.png)

Cuối cùng chúng tôi có thể có các trang để hiển thị danh sách và thông tin chi tiết cho sách, thể loại, tác giả và phiên bản sách, cùng với các trang để tạo, cập nhật và xóa bản ghi. Đó là rất nhiều để ghi lại trong một bài viết. Do đó phần lớn bài viết này sẽ tập trung vào thiết lập các tuyến đường và bộ điều khiển để trả về nội dung "giả". Chúng tôi sẽ mở rộng các phương thức bộ điều khiển trong các bài viết tiếp theo để làm việc với dữ liệu mô hình.

Phần đầu tiên bên dưới cung cấp "giới thiệu" ngắn gọn về cách sử dụng middleware [Router](https://expressjs.com/en/5x/api.html#router) của Express. Chúng tôi sẽ sử dụng kiến thức đó trong các phần sau khi chúng tôi thiết lập các tuyến đường LocalLibrary.

## Giới thiệu về tuyến đường

Tuyến đường là một phần của mã Express liên kết một [HTTP verb](/en-US/docs/Web/HTTP/Reference/Methods) (`GET`, `POST`, `PUT`, `DELETE`, v.v.), một đường dẫn/mẫu URL và một hàm được gọi để xử lý mẫu đó.

Có một số cách để tạo tuyến đường. Cho hướng dẫn này, chúng tôi sẽ sử dụng middleware [`express.Router`](https://expressjs.com/en/guide/routing.html#express-router) vì nó cho phép chúng tôi nhóm các trình xử lý tuyến đường cho một phần cụ thể của trang web lại với nhau và truy cập chúng bằng cách sử dụng tiền tố tuyến đường chung. Chúng tôi sẽ giữ tất cả các tuyến đường liên quan đến thư viện trong module "catalog" và nếu chúng tôi thêm tuyến đường để xử lý tài khoản người dùng hoặc các chức năng khác, chúng tôi có thể giữ chúng được nhóm riêng biệt.

> [!NOTE]
> Chúng tôi đã thảo luận ngắn gọn về các tuyến đường ứng dụng Express trong [Giới thiệu Express > Tạo trình xử lý tuyến đường](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction#creating_route_handlers). Ngoài việc cung cấp hỗ trợ tốt hơn cho mô-đun hóa (như được thảo luận trong tiểu phần đầu tiên bên dưới), sử dụng _Router_ rất tương tự với việc định nghĩa các tuyến đường trực tiếp trên _đối tượng ứng dụng Express_.

Phần còn lại của phần này cung cấp tổng quan về cách `Router` có thể được sử dụng để định nghĩa các tuyến đường.

### Định nghĩa và sử dụng các module tuyến đường riêng biệt

Mã bên dưới cung cấp một ví dụ cụ thể về cách chúng tôi có thể tạo module tuyến đường và sau đó sử dụng nó trong ứng dụng _Express_.

Đầu tiên chúng tôi tạo các tuyến đường cho wiki trong module có tên **wiki.js**. Mã đầu tiên import đối tượng ứng dụng Express, sử dụng nó để lấy đối tượng `Router` và sau đó thêm một vài tuyến đường vào nó bằng phương thức `get()`. Cuối cùng module export đối tượng `Router`.

```js
// wiki.js - Wiki route module.

const express = require("express");

const router = express.Router();

// Home page route.
router.get("/", (req, res) => {
  res.send("Wiki home page");
});

// About page route.
router.get("/about", (req, res) => {
  res.send("About this wiki");
});

module.exports = router;
```

> [!NOTE]
> Ở trên chúng tôi đang định nghĩa các hàm gọi lại trình xử lý tuyến đường trực tiếp trong các hàm bộ định tuyến. Trong LocalLibrary, chúng tôi sẽ định nghĩa các hàm gọi lại này trong module bộ điều khiển riêng biệt.

Để sử dụng module bộ định tuyến trong tệp ứng dụng chính của chúng tôi, trước tiên chúng tôi `require()` module tuyến đường (**wiki.js**). Sau đó chúng tôi gọi `use()` trên ứng dụng _Express_ để thêm Bộ định tuyến vào đường dẫn xử lý middleware, chỉ định đường dẫn URL là 'wiki'.

```js
const wiki = require("./wiki.js");

// …
app.use("/wiki", wiki);
```

Hai tuyến đường được định nghĩa trong module tuyến đường wiki của chúng tôi sau đó có thể truy cập từ `/wiki/` và `/wiki/about/`.

### Các hàm tuyến đường

Module của chúng tôi ở trên định nghĩa một vài hàm tuyến đường điển hình. Tuyến đường "about" (được tái tạo bên dưới) được định nghĩa bằng phương thức `Router.get()`, phản hồi chỉ với các yêu cầu HTTP GET. Đối số đầu tiên của phương thức này là đường dẫn URL trong khi đối số thứ hai là hàm gọi lại sẽ được gọi nếu nhận được yêu cầu HTTP GET với đường dẫn đó.

```js
router.get("/about", (req, res) => {
  res.send("About this wiki");
});
```

Hàm gọi lại lấy ba đối số (thường được đặt tên như được hiển thị: `req`, `res`, `next`), sẽ chứa đối tượng Yêu cầu HTTP, phản hồi HTTP và hàm _next_ trong chuỗi middleware.

> [!NOTE]
> Các hàm Router là [middleware Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction#using_middleware), có nghĩa là chúng phải hoàn thành (phản hồi) yêu cầu hoặc gọi hàm `next` trong chuỗi. Trong trường hợp trên chúng tôi hoàn thành yêu cầu bằng `send()`, vì vậy đối số `next` không được sử dụng (và chúng tôi chọn không chỉ định nó).
>
> Hàm bộ định tuyến ở trên lấy một hàm gọi lại duy nhất, nhưng bạn có thể chỉ định nhiều đối số hàm gọi lại tùy thích, hoặc một mảng các hàm gọi lại. Mỗi hàm là một phần của chuỗi middleware và sẽ được gọi theo thứ tự nó được thêm vào chuỗi (trừ khi hàm trước đó hoàn thành yêu cầu).

Hàm gọi lại ở đây gọi [`send()`](https://expressjs.com/en/5x/api.html#res.send) trên phản hồi để trả về chuỗi "About this wiki" khi chúng tôi nhận được yêu cầu GET với đường dẫn (`/about`). Có một [số phương thức phản hồi khác](https://expressjs.com/en/guide/routing.html#response-methods) để kết thúc chu kỳ yêu cầu/phản hồi. Ví dụ: bạn có thể gọi [`res.json()`](https://expressjs.com/en/5x/api.html#res.json) để gửi phản hồi JSON hoặc [`res.sendFile()`](https://expressjs.com/en/5x/api.html#res.sendFile) để gửi một tệp. Phương thức phản hồi mà chúng tôi sẽ sử dụng thường xuyên nhất khi xây dựng thư viện là [`render()`](https://expressjs.com/en/5x/api.html#res.render), tạo và trả về các tệp HTML bằng mẫu và dữ liệu — chúng tôi sẽ nói nhiều hơn về điều đó trong một bài viết sau!

### Các HTTP verb

Các tuyến đường ví dụ ở trên sử dụng phương thức `Router.get()` để phản hồi các yêu cầu HTTP `GET` với một đường dẫn nhất định.

`Router` cũng cung cấp các phương thức tuyến đường cho tất cả các [HTTP verb](/en-US/docs/Web/HTTP/Reference/Methods) khác, hầu hết được sử dụng theo cách hoàn toàn giống nhau: `post()`, `put()`, `delete()`, `options()`, `trace()`, `copy()`, `lock()`, `mkcol()`, `move()`, `purge()`, `propfind()`, `proppatch()`, `unlock()`, `report()`, `mkactivity()`, `checkout()`, `merge()`, `m-search()`, `notify()`, `subscribe()`, `unsubscribe()`, `patch()`, `search()` và `connect()`.

Ví dụ: mã bên dưới hoạt động giống như tuyến đường `/about` trước đó, nhưng chỉ phản hồi các yêu cầu HTTP POST.

```js
router.post("/about", (req, res) => {
  res.send("About this wiki");
});
```

Các trang web nên lý tưởng sử dụng phương thức tuyến đường (và phương thức HTTP) tương ứng tốt nhất với hoạt động đang được thực hiện.
Ví dụ: ứng dụng được render phía máy khách nên sử dụng `Router.get()` để đọc từ cơ sở dữ liệu, `Router.post()` để tạo bản ghi mới, `Router.put()` hoặc `Router.patch()` để cập nhật bản ghi và `Router.delete()` để xóa dữ liệu.

Tuy nhiên, lưu ý rằng các ứng dụng được render phía máy chủ, chẳng hạn như ứng dụng được thể hiện bởi hướng dẫn này, thường sử dụng `Router.post()` cho tất cả các tuyến đường sửa đổi dữ liệu.
Lý do cho điều này là, theo mặc định, các phần tử HTML `<form>` chỉ có thể gửi các yêu cầu [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) và [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST).

Có nhiều cách giải quyết cho giới hạn này, chẳng hạn như mã hóa HTTP verb "mong muốn" trong yêu cầu `POST` và sử dụng middleware Express [method-override](https://www.npmjs.com/package/method-override) để sửa đổi yêu cầu thành HTTP verb phù hợp trước khi nó được chuyển đến bộ định tuyến.
Đối với các ứng dụng cơ bản, việc viết lại mã chỉ để sử dụng đúng HTTP verb thường là quá mức.
Có thể đáng cải thiện logging máy chủ hoặc nếu máy chủ cần xử lý cả nội dung được render phía máy chủ và phía máy khách thông qua cùng một điểm cuối.

### Đường dẫn tuyến đường

Đường dẫn tuyến đường định nghĩa các điểm cuối mà tại đó các yêu cầu có thể được thực hiện. Các ví dụ chúng tôi đã thấy cho đến nay chỉ là các chuỗi và được sử dụng chính xác như được viết: '/', '/about', '/book', '/any-random.path'.

Đường dẫn tuyến đường cũng có thể là các mẫu chuỗi. Các mẫu chuỗi sử dụng dạng cú pháp biểu thức chính quy để định nghĩa _mẫu_ các điểm cuối sẽ được khớp.
Hầu hết các tuyến đường của chúng tôi cho LocalLibrary sẽ sử dụng chuỗi và không sử dụng biểu thức chính quy.
Chúng tôi cũng sẽ sử dụng tham số tuyến đường như được thảo luận trong phần tiếp theo.

### Tham số tuyến đường

Tham số tuyến đường là _các đoạn URL được đặt tên_ được sử dụng để nắm bắt các giá trị tại các vị trí cụ thể trong URL. Các đoạn được đặt tên được đặt tiền tố bằng dấu hai chấm và sau đó là tên (Ví dụ: `/:your_parameter_name/`). Các giá trị được nắm bắt được lưu trữ trong đối tượng `req.params` bằng cách sử dụng tên tham số làm khóa (Ví dụ: `req.params.your_parameter_name`).

Vì vậy, ví dụ: xem xét URL được mã hóa để chứa thông tin về người dùng và sách: `http://localhost:3000/users/34/books/8989`. Chúng tôi có thể trích xuất thông tin này như được hiển thị bên dưới, với các tham số đường dẫn `userId` và `bookId`:

```js
app.get("/users/:userId/books/:bookId", (req, res) => {
  // Access userId via: req.params.userId
  // Access bookId via: req.params.bookId
  res.send(req.params);
});
```

> [!NOTE]
> URL _/book/create_ sẽ được khớp bởi tuyến đường như `/book/:bookId` (vì `:bookId` là trình giữ chỗ cho _bất kỳ_ chuỗi nào, do đó `create` khớp). Tuyến đường đầu tiên khớp với URL đến sẽ được sử dụng, vì vậy nếu bạn muốn xử lý cụ thể các URL `/book/create`, trình xử lý tuyến đường của nó phải được định nghĩa trước tuyến đường `/book/:bookId` của bạn.

Tên tham số tuyến đường (ví dụ: `bookId` ở trên) có thể là bất kỳ định danh JavaScript hợp lệ nào bắt đầu bằng chữ cái, `_` hoặc `$`. Bạn có thể bao gồm chữ số sau ký tự đầu tiên, nhưng không có gạch nối và khoảng trắng.
Bạn cũng có thể sử dụng tên không phải là định danh JavaScript hợp lệ, bao gồm khoảng trắng, gạch nối, biểu tượng cảm xúc hoặc bất kỳ ký tự nào khác, nhưng bạn cần định nghĩa chúng bằng chuỗi được trích dẫn và truy cập chúng bằng ký hiệu ngoặc vuông.
Ví dụ:

```js
app.get('/users/:"user id"/books/:"book-id"', (req, res) => {
  // Access quoted param using bracket notation
  const user = req.params["user id"];
  const book = req.params["book-id"];
  res.send({ user, book });
});
```

### Ký tự đại diện

Tham số ký tự đại diện khớp một hoặc nhiều ký tự trên nhiều đoạn, trả về mỗi đoạn dưới dạng giá trị trong mảng.
Chúng được định nghĩa theo cách tương tự như tham số thông thường, nhưng được đặt tiền tố bằng dấu hoa thị.

Vì vậy, ví dụ: xem xét URL `http://localhost:3000/users/34/books/8989`, chúng tôi có thể trích xuất tất cả thông tin sau `users/` với ký tự đại diện `example`:

```js
app.get("/users/*example", (req, res) => {
  // req.params would contain { "example": ["34", "books", "8989"]}
  res.send(req.params);
});
```

### Các phần tùy chọn

Dấu ngoặc nhọn có thể được sử dụng để định nghĩa các phần của đường dẫn là tùy chọn.
Ví dụ: bên dưới chúng tôi khớp với tên tệp có bất kỳ phần mở rộng nào (hoặc không có).

```js
app.get("/file/:filename{.:ext}", (req, res) => {
  // Given URL: http://localhost:3000/file/somefile.md`
  // req.params would contain { "filename": "somefile", "ext": "md"}
  res.send(req.params);
});
```

### Các ký tự được đặt trước

Các ký tự sau được đặt trước: `(()[]?+!)`.
Nếu bạn muốn sử dụng chúng, bạn phải thoát chúng bằng dấu gạch chéo ngược (`\`).

Bạn cũng không thể sử dụng ký tự pipe (`|`) trong biểu thức chính quy.

Đó là tất cả những gì bạn cần để bắt đầu với tuyến đường.
Nếu cần, bạn có thể tìm thêm thông tin trong tài liệu Express: [Định tuyến cơ bản](https://expressjs.com/en/starter/basic-routing.html) và [Hướng dẫn định tuyến](https://expressjs.com/en/guide/routing.html). Các phần sau đây chỉ cách chúng tôi sẽ thiết lập các tuyến đường và bộ điều khiển cho LocalLibrary.

### Xử lý lỗi và ngoại lệ trong các hàm tuyến đường

Các hàm tuyến đường được hiển thị trước đó đều có đối số `req` và `res`, đại diện cho yêu cầu và phản hồi, tương ứng.
Các hàm tuyến đường cũng được truyền đối số thứ ba, `next`, chứa hàm gọi lại có thể được gọi để chuyển bất kỳ lỗi hoặc ngoại lệ nào đến chuỗi middleware Express, nơi chúng cuối cùng sẽ lan truyền đến mã xử lý lỗi toàn cục của bạn.

Từ Express 5, `next` được gọi tự động với giá trị từ chối nếu trình xử lý tuyến đường trả về [Promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) sau đó bị từ chối; do đó, không cần mã xử lý lỗi trong các hàm tuyến đường khi sử dụng promises.
Điều này dẫn đến mã rất gọn gàng khi làm việc với các API promise bất đồng bộ, đặc biệt khi sử dụng [`async` và `await`](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises#async_and_await).

Ví dụ: đoạn mã sau sử dụng phương thức `find()` để truy vấn cơ sở dữ liệu và sau đó render kết quả.

```js
exports.get("/about", async (req, res, next) => {
  const successfulResult = await About.find({}).exec();
  res.render("about_view", { title: "About", list: successfulResult });
});
```

Đoạn mã bên dưới hiển thị cùng ví dụ bằng cách sử dụng chuỗi promise.
Lưu ý rằng nếu bạn muốn, bạn có thể `catch()` lỗi và triển khai xử lý tùy chỉnh của riêng bạn.

```js
exports.get(
  "/about",
  // Removed 'async'
  (req, res, next) =>
    About.find({})
      .exec()
      .then((successfulResult) => {
        res.render("about_view", { title: "About", list: successfulResult });
      })
      .catch((err) => {
        next(err);
      }),
);
```

> [!NOTE]
> Hầu hết các API hiện đại là bất đồng bộ và dựa trên promise, vì vậy xử lý lỗi thường đơn giản như vậy.
> Chắc chắn đó là tất cả những gì bạn thực sự _cần_ biết về xử lý lỗi cho hướng dẫn này!

Express 5 tự động bắt và chuyển tiếp các ngoại lệ được ném ra trong mã đồng bộ:

```js
app.get("/", (req, res) => {
  // Express will catch this
  throw new Error("SynchronousException");
});
```

Tuy nhiên, bạn phải [`catch()`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) các ngoại lệ xảy ra trong mã bất đồng bộ được gọi bởi các trình xử lý tuyến đường hoặc middleware. Chúng sẽ không được bắt bởi mã mặc định:

```js
app.get("/", (req, res, next) => {
  setTimeout(() => {
    try {
      // You must catch and propagate this error yourself
      throw new Error("AsynchronousException");
    } catch (err) {
      next(err);
    }
  }, 100);
});
```

Cuối cùng, nếu bạn đang sử dụng phong cách cũ hơn của các phương thức bất đồng bộ trả về lỗi hoặc kết quả trong hàm gọi lại, thì bạn cần tự lan truyền lỗi.
Ví dụ sau cho thấy cách thực hiện.

```js
router.get("/about", (req, res, next) => {
  About.find({}).exec((err, queryResults) => {
    if (err) {
      // Propagate the error
      return next(err);
    }
    // Successful, so render
    res.render("about_view", { title: "About", list: queryResults });
  });
});
```

Để biết thêm thông tin xem [Xử lý lỗi](https://expressjs.com/en/guide/error-handling.html).

## Các tuyến đường cần thiết cho LocalLibrary

Các URL mà cuối cùng chúng tôi sẽ cần cho các trang của mình được liệt kê bên dưới, trong đó _object_ được thay thế bằng tên của mỗi mô hình (book, bookinstance, genre, author), _objects_ là số nhiều của object và _id_ là trường cá thể duy nhất (`_id`) được cung cấp cho mỗi cá thể mô hình Mongoose theo mặc định.

- `catalog/` — Trang chủ/index.
- `catalog/<objects>/` — Danh sách tất cả sách, phiên bản sách, thể loại hoặc tác giả (ví dụ: /`catalog/books/`, /`catalog/genres/`, v.v.)
- `catalog/<object>/<id>` — Trang chi tiết cho một sách, phiên bản sách, thể loại hoặc tác giả cụ thể với giá trị trường `_id` đã cho (ví dụ: `/catalog/book/584493c1f4887f06c0e67d37)`).
- `catalog/<object>/create` — Biểu mẫu để tạo sách, phiên bản sách, thể loại hoặc tác giả mới (ví dụ: `/catalog/book/create)`).
- `catalog/<object>/<id>/update` — Biểu mẫu để cập nhật sách, phiên bản sách, thể loại hoặc tác giả cụ thể với giá trị trường `_id` đã cho (ví dụ: `/catalog/book/584493c1f4887f06c0e67d37/update)`).
- `catalog/<object>/<id>/delete` — Biểu mẫu để xóa sách, phiên bản sách, thể loại hoặc tác giả cụ thể với giá trị trường `_id` đã cho (ví dụ: `/catalog/book/584493c1f4887f06c0e67d37/delete)`).

Trang chủ và các trang danh sách đầu tiên không mã hóa bất kỳ thông tin bổ sung nào. Trong khi các kết quả được trả về sẽ phụ thuộc vào loại mô hình và nội dung trong cơ sở dữ liệu, các truy vấn chạy để lấy thông tin sẽ luôn giống nhau (tương tự như mã chạy để tạo đối tượng sẽ luôn tương tự).

Ngược lại, các URL khác được sử dụng để hành động trên một tài liệu/cá thể mô hình cụ thể — những URL này mã hóa danh tính của mục trong URL (được hiển thị là `<id>` ở trên). Chúng tôi sẽ sử dụng các tham số đường dẫn để trích xuất thông tin được mã hóa và truyền nó đến trình xử lý tuyến đường (và trong một bài viết sau, chúng tôi sẽ sử dụng điều này để xác định động những thông tin nào cần lấy từ cơ sở dữ liệu). Bằng cách mã hóa thông tin trong URL, chúng tôi chỉ cần một tuyến đường cho mỗi tài nguyên của một loại cụ thể (ví dụ: một tuyến đường để xử lý hiển thị mọi mục sách đơn lẻ).

> [!NOTE]
> Express cho phép bạn xây dựng các URL theo bất kỳ cách nào bạn thích — bạn có thể mã hóa thông tin trong phần thân URL như được hiển thị ở trên hoặc sử dụng tham số URL `GET` (ví dụ: `/book/?id=6`). Dù bạn sử dụng cách tiếp cận nào, các URL nên được giữ sạch, logic và dễ đọc ([xem lời khuyên của W3C tại đây](https://www.w3.org/Provider/Style/URI)).

Tiếp theo chúng tôi tạo các hàm gọi lại trình xử lý tuyến đường và mã tuyến đường cho tất cả các URL ở trên.

## Tạo các hàm gọi lại trình xử lý tuyến đường

Trước khi chúng tôi định nghĩa các tuyến đường, trước tiên chúng tôi sẽ tạo tất cả các hàm gọi lại giả/khung mà chúng sẽ gọi. Các hàm gọi lại sẽ được lưu trữ trong các module "bộ điều khiển" riêng biệt cho `Book`, `BookInstance`, `Genre` và `Author` (bạn có thể sử dụng bất kỳ cấu trúc tệp/module nào, nhưng đây có vẻ là độ chi tiết thích hợp cho dự án này).

Bắt đầu bằng cách tạo thư mục cho các bộ điều khiển trong thư mục gốc dự án (**/controllers**) và sau đó tạo các tệp/module bộ điều khiển riêng biệt để xử lý từng mô hình:

```plain
/express-locallibrary-tutorial  # the project root
  /controllers
    authorController.js
    bookController.js
    bookinstanceController.js
    genreController.js
```

### Bộ điều khiển Author

Mở tệp **/controllers/authorController.js** và gõ vào mã sau:

```js
const Author = require("../models/author");

// Display list of all Authors.
exports.author_list = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author list");
};

// Display detail page for a specific Author.
exports.author_detail = async (req, res, next) => {
  res.send(`NOT IMPLEMENTED: Author detail: ${req.params.id}`);
};

// Display Author create form on GET.
exports.author_create_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author create GET");
};

// Handle Author create on POST.
exports.author_create_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author create POST");
};

// Display Author delete form on GET.
exports.author_delete_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author delete GET");
};

// Handle Author delete on POST.
exports.author_delete_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author delete POST");
};

// Display Author update form on GET.
exports.author_update_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author update GET");
};

// Handle Author update on POST.
exports.author_update_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Author update POST");
};
```

Module đầu tiên yêu cầu mô hình `Author` mà chúng tôi sau đó sẽ sử dụng để truy cập và cập nhật dữ liệu của mình.
Sau đó nó export các hàm cho mỗi URL mà chúng tôi muốn xử lý.
Lưu ý rằng các hoạt động tạo, cập nhật và xóa sử dụng biểu mẫu và do đó cũng có các phương thức bổ sung để xử lý các yêu cầu POST biểu mẫu — chúng tôi sẽ thảo luận các phương thức đó trong "bài viết biểu mẫu" sau này.

Các hàm phản hồi với chuỗi cho biết trang liên quan chưa được tạo.
Nếu hàm bộ điều khiển được mong đợi nhận các tham số đường dẫn, chúng được xuất ra trong chuỗi thông báo (xem `req.params.id` ở trên).

#### Bộ điều khiển BookInstance

Mở tệp **/controllers/bookinstanceController.js** và sao chép mã sau (theo mẫu giống hệt với module bộ điều khiển `Author`):

```js
const BookInstance = require("../models/bookinstance");

// Display list of all BookInstances.
exports.bookinstance_list = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance list");
};

// Display detail page for a specific BookInstance.
exports.bookinstance_detail = async (req, res, next) => {
  res.send(`NOT IMPLEMENTED: BookInstance detail: ${req.params.id}`);
};

// Display BookInstance create form on GET.
exports.bookinstance_create_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance create GET");
};

// Handle BookInstance create on POST.
exports.bookinstance_create_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance create POST");
};

// Display BookInstance delete form on GET.
exports.bookinstance_delete_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance delete GET");
};

// Handle BookInstance delete on POST.
exports.bookinstance_delete_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance delete POST");
};

// Display BookInstance update form on GET.
exports.bookinstance_update_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance update GET");
};

// Handle bookinstance update on POST.
exports.bookinstance_update_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: BookInstance update POST");
};
```

#### Bộ điều khiển Genre

Mở tệp **/controllers/genreController.js** và sao chép văn bản sau (theo mẫu giống hệt với các tệp `Author` và `BookInstance`):

```js
const Genre = require("../models/genre");

// Display list of all Genre.
exports.genre_list = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre list");
};

// Display detail page for a specific Genre.
exports.genre_detail = async (req, res, next) => {
  res.send(`NOT IMPLEMENTED: Genre detail: ${req.params.id}`);
};

// Display Genre create form on GET.
exports.genre_create_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre create GET");
};

// Handle Genre create on POST.
exports.genre_create_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre create POST");
};

// Display Genre delete form on GET.
exports.genre_delete_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre delete GET");
};

// Handle Genre delete on POST.
exports.genre_delete_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre delete POST");
};

// Display Genre update form on GET.
exports.genre_update_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre update GET");
};

// Handle Genre update on POST.
exports.genre_update_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Genre update POST");
};
```

#### Bộ điều khiển Book

Mở tệp **/controllers/bookController.js** và sao chép mã sau.
Điều này theo cùng mẫu với các module bộ điều khiển khác, nhưng ngoài ra có hàm `index()` để hiển thị trang chào mừng trang web:

```js
const Book = require("../models/book");

exports.index = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Site Home Page");
};

// Display list of all books.
exports.book_list = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book list");
};

// Display detail page for a specific book.
exports.book_detail = async (req, res, next) => {
  res.send(`NOT IMPLEMENTED: Book detail: ${req.params.id}`);
};

// Display book create form on GET.
exports.book_create_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book create GET");
};

// Handle book create on POST.
exports.book_create_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book create POST");
};

// Display book delete form on GET.
exports.book_delete_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book delete GET");
};

// Handle book delete on POST.
exports.book_delete_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book delete POST");
};

// Display book update form on GET.
exports.book_update_get = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book update GET");
};

// Handle book update on POST.
exports.book_update_post = async (req, res, next) => {
  res.send("NOT IMPLEMENTED: Book update POST");
};
```

## Tạo module tuyến đường catalog

Tiếp theo chúng tôi tạo _tuyến đường_ cho tất cả các URL [cần thiết bởi trang web LocalLibrary](#routes_needed_for_the_locallibrary), sẽ gọi các hàm bộ điều khiển chúng tôi đã định nghĩa trong các phần trước.

Khung đã có thư mục **./routes** chứa các tuyến đường cho _index_ và _users_.
Tạo tệp tuyến đường khác — **catalog.js** — bên trong thư mục này, như được hiển thị.

```plain
/express-locallibrary-tutorial # the project root
  /routes
    index.js
    users.js
    catalog.js
```

Mở **/routes/catalog.js** và sao chép mã bên dưới:

```js
const express = require("express");

// Require controller modules.
const book_controller = require("../controllers/bookController");
const author_controller = require("../controllers/authorController");
const genre_controller = require("../controllers/genreController");
const book_instance_controller = require("../controllers/bookinstanceController");

const router = express.Router();

/// BOOK ROUTES ///

// GET catalog home page.
router.get("/", book_controller.index);

// GET request for creating a Book. NOTE This must come before routes that display Book (uses id).
router.get("/book/create", book_controller.book_create_get);

// POST request for creating Book.
router.post("/book/create", book_controller.book_create_post);

// GET request to delete Book.
router.get("/book/:id/delete", book_controller.book_delete_get);

// POST request to delete Book.
router.post("/book/:id/delete", book_controller.book_delete_post);

// GET request to update Book.
router.get("/book/:id/update", book_controller.book_update_get);

// POST request to update Book.
router.post("/book/:id/update", book_controller.book_update_post);

// GET request for one Book.
router.get("/book/:id", book_controller.book_detail);

// GET request for list of all Book items.
router.get("/books", book_controller.book_list);

/// AUTHOR ROUTES ///

// GET request for creating Author. NOTE This must come before route for id (i.e. display author).
router.get("/author/create", author_controller.author_create_get);

// POST request for creating Author.
router.post("/author/create", author_controller.author_create_post);

// GET request to delete Author.
router.get("/author/:id/delete", author_controller.author_delete_get);

// POST request to delete Author.
router.post("/author/:id/delete", author_controller.author_delete_post);

// GET request to update Author.
router.get("/author/:id/update", author_controller.author_update_get);

// POST request to update Author.
router.post("/author/:id/update", author_controller.author_update_post);

// GET request for one Author.
router.get("/author/:id", author_controller.author_detail);

// GET request for list of all Authors.
router.get("/authors", author_controller.author_list);

/// GENRE ROUTES ///

// GET request for creating a Genre. NOTE This must come before route that displays Genre (uses id).
router.get("/genre/create", genre_controller.genre_create_get);

// POST request for creating Genre.
router.post("/genre/create", genre_controller.genre_create_post);

// GET request to delete Genre.
router.get("/genre/:id/delete", genre_controller.genre_delete_get);

// POST request to delete Genre.
router.post("/genre/:id/delete", genre_controller.genre_delete_post);

// GET request to update Genre.
router.get("/genre/:id/update", genre_controller.genre_update_get);

// POST request to update Genre.
router.post("/genre/:id/update", genre_controller.genre_update_post);

// GET request for one Genre.
router.get("/genre/:id", genre_controller.genre_detail);

// GET request for list of all Genre.
router.get("/genres", genre_controller.genre_list);

/// BOOKINSTANCE ROUTES ///

// GET request for creating a BookInstance. NOTE This must come before route that displays BookInstance (uses id).
router.get(
  "/bookinstance/create",
  book_instance_controller.bookinstance_create_get,
);

// POST request for creating BookInstance.
router.post(
  "/bookinstance/create",
  book_instance_controller.bookinstance_create_post,
);

// GET request to delete BookInstance.
router.get(
  "/bookinstance/:id/delete",
  book_instance_controller.bookinstance_delete_get,
);

// POST request to delete BookInstance.
router.post(
  "/bookinstance/:id/delete",
  book_instance_controller.bookinstance_delete_post,
);

// GET request to update BookInstance.
router.get(
  "/bookinstance/:id/update",
  book_instance_controller.bookinstance_update_get,
);

// POST request to update BookInstance.
router.post(
  "/bookinstance/:id/update",
  book_instance_controller.bookinstance_update_post,
);

// GET request for one BookInstance.
router.get("/bookinstance/:id", book_instance_controller.bookinstance_detail);

// GET request for list of all BookInstance.
router.get("/bookinstances", book_instance_controller.bookinstance_list);

module.exports = router;
```

Module yêu cầu Express và sau đó sử dụng nó để tạo đối tượng `Router`. Các tuyến đường đều được thiết lập trên bộ định tuyến, sau đó được export.

Các tuyến đường được định nghĩa bằng cách sử dụng phương thức `.get()` hoặc `.post()` trên đối tượng bộ định tuyến.
Tất cả các đường dẫn được định nghĩa bằng chuỗi (chúng tôi không sử dụng mẫu chuỗi hoặc biểu thức chính quy).
Các tuyến đường hành động trên tài nguyên cụ thể (ví dụ: sách) sử dụng tham số đường dẫn để lấy id đối tượng từ URL.

Tất cả các hàm xử lý được import từ các module bộ điều khiển chúng tôi đã tạo trong phần trước.

### Cập nhật module tuyến đường index

Chúng tôi đã thiết lập tất cả các tuyến đường mới, nhưng chúng tôi vẫn có tuyến đường đến trang gốc. Thay vào đó, hãy chuyển hướng này đến trang index mới mà chúng tôi đã tạo tại đường dẫn `/catalog`.

Mở **/routes/index.js** và thay thế tuyến đường hiện có bằng hàm bên dưới.

```js
// GET home page.
router.get("/", (req, res) => {
  res.redirect("/catalog");
});
```

> [!NOTE]
> Đây là lần đầu tiên chúng tôi sử dụng phương thức phản hồi [redirect()](https://expressjs.com/en/5x/api.html#res.redirect). Điều này chuyển hướng đến trang được chỉ định, mặc định gửi mã trạng thái HTTP "302 Found". Bạn có thể thay đổi mã trạng thái được trả về nếu cần và cung cấp đường dẫn tuyệt đối hoặc tương đối.

### Cập nhật app.js

Bước cuối cùng là thêm các tuyến đường vào chuỗi middleware.
Chúng tôi thực hiện điều này trong `app.js`.

Mở **app.js** và yêu cầu tuyến đường catalog bên dưới các tuyến đường khác (thêm dòng thứ ba được hiển thị bên dưới, bên dưới hai dòng khác đã có trong tệp):

```js
const indexRouter = require("./routes/index");
const usersRouter = require("./routes/users");
const catalogRouter = require("./routes/catalog"); // Import routes for "catalog" area of site
```

Tiếp theo, thêm tuyến đường catalog vào ngăn xếp middleware bên dưới các tuyến đường khác (thêm dòng thứ ba được hiển thị bên dưới, bên dưới hai dòng khác đã có trong tệp):

```js
app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/catalog", catalogRouter); // Add catalog routes to middleware chain.
```

> [!NOTE]
> Chúng tôi đã thêm module catalog của mình tại đường dẫn `/catalog`. Điều này được thêm vào phía trước tất cả các đường dẫn được định nghĩa trong module catalog. Vì vậy, ví dụ: để truy cập danh sách sách, URL sẽ là: `/catalog/books/`.

Đó là tất cả. Bây giờ chúng tôi nên có các tuyến đường và các hàm khung được kích hoạt cho tất cả các URL mà cuối cùng chúng tôi sẽ hỗ trợ trên trang web LocalLibrary.

### Kiểm thử các tuyến đường

Để kiểm thử các tuyến đường, trước tiên khởi động trang web bằng phương pháp thông thường của bạn

- Phương pháp mặc định

  ```bash
  # Windows
  SET DEBUG=express-locallibrary-tutorial:* & npm start

  # macOS or Linux
  DEBUG=express-locallibrary-tutorial:* npm start
  ```

- Nếu bạn đã thiết lập trước đó [nodemon](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website#enable_server_restart_on_file_changes), thay vào đó bạn có thể sử dụng:

  ```bash
  npm run serverstart
  ```

Sau đó điều hướng đến một số URL LocalLibrary và xác minh rằng bạn không nhận được trang lỗi (HTTP 404). Một tập hợp nhỏ URL được liệt kê bên dưới để thuận tiện cho bạn:

- `http://localhost:3000/`
- `http://localhost:3000/catalog`
- `http://localhost:3000/catalog/books`
- `http://localhost:3000/catalog/bookinstances/`
- `http://localhost:3000/catalog/authors/`
- `http://localhost:3000/catalog/genres/`
- `http://localhost:3000/catalog/book/5846437593935e2f8c2aa226`
- `http://localhost:3000/catalog/book/create`

## Tóm tắt

Chúng tôi đã tạo tất cả các tuyến đường cho trang web của mình, cùng với các hàm bộ điều khiển giả mà chúng tôi có thể điền bằng một triển khai đầy đủ trong các bài viết sau. Trong quá trình đó, chúng tôi đã học được rất nhiều thông tin cơ bản về các tuyến đường Express, xử lý ngoại lệ và một số cách tiếp cận để cấu trúc các tuyến đường và bộ điều khiển của chúng tôi.

Trong bài viết tiếp theo của chúng tôi, chúng tôi sẽ tạo trang chào mừng thực sự cho trang web, sử dụng views (mẫu) và thông tin được lưu trữ trong các mô hình của chúng tôi.

## Xem thêm

- [Định tuyến cơ bản](https://expressjs.com/en/starter/basic-routing.html) (Tài liệu Express)
- [Hướng dẫn định tuyến](https://expressjs.com/en/guide/routing.html) (Tài liệu Express)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose", "Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
