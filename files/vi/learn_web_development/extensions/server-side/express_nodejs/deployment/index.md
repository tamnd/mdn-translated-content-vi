---
title: "Express Tutorial Part 7: Deploying to production"
short-title: "7: Deploying"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/forms", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bây giờ bạn đã tạo (và kiểm thử) một trang web mẫu sử dụng Express, đã đến lúc triển khai nó lên một máy chủ web để mọi người có thể truy cập qua internet công cộng.
Trang này giải thích cách lưu trữ một dự án Express và trình bày những gì bạn cần làm để chuẩn bị cho môi trường sản xuất.

<table>
  <tbody>
    <tr>
      <th scope="row">Yêu cầu:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms">Hướng dẫn Express Phần 6: Làm việc với biểu mẫu</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu nơi và cách bạn có thể triển khai một ứng dụng Express lên môi trường sản xuất.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Khi trang web của bạn đã hoàn thành (hoặc hoàn thành "đủ" để bắt đầu kiểm thử công khai), bạn sẽ cần lưu trữ nó ở một nơi nào đó công khai và có thể truy cập hơn máy tính phát triển cá nhân của bạn.

Cho đến nay, bạn đã làm việc trong một [môi trường phát triển](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment), sử dụng Express/Node làm máy chủ web để chia sẻ trang web của bạn với trình duyệt/mạng cục bộ, và chạy trang web của bạn với các cài đặt phát triển (không an toàn) hiển thị thông tin gỡ lỗi và các thông tin riêng tư khác. Trước khi bạn có thể lưu trữ một trang web bên ngoài, trước tiên bạn sẽ phải:

- Chọn một môi trường để lưu trữ ứng dụng Express.
- Thực hiện một vài thay đổi trong các cài đặt dự án của bạn.
- Thiết lập một cơ sở hạ tầng cấp độ sản xuất để phục vụ trang web của bạn.

Hướng dẫn này cung cấp một số hướng dẫn về các lựa chọn của bạn khi chọn một trang web lưu trữ, tổng quan ngắn gọn về những gì bạn cần làm để chuẩn bị ứng dụng Express của mình cho môi trường sản xuất, và một ví dụ thực tế về cách cài đặt trang web LocalLibrary trên dịch vụ lưu trữ đám mây [Railway](https://railway.com/).

## Môi trường sản xuất là gì?

Môi trường sản xuất là môi trường được cung cấp bởi máy chủ, nơi bạn sẽ chạy trang web của mình cho việc sử dụng bên ngoài. Môi trường bao gồm:

- Phần cứng máy tính nơi trang web chạy.
- Hệ điều hành (ví dụ: Linux hoặc Windows).
- Môi trường chạy ngôn ngữ lập trình và các thư viện framework mà trang web của bạn được viết bằng.
- Cơ sở hạ tầng máy chủ web, có thể bao gồm máy chủ web, reverse proxy, bộ cân bằng tải, v.v.
- Cơ sở dữ liệu mà trang web của bạn phụ thuộc vào.

Máy chủ có thể nằm tại cơ sở của bạn và kết nối Internet bằng một đường dẫn nhanh, nhưng phổ biến hơn là sử dụng một máy tính được lưu trữ "trên đám mây". Điều này thực sự có nghĩa là mã của bạn được chạy trên một máy tính từ xa (hoặc có thể là một máy tính "ảo") trong trung tâm dữ liệu của công ty lưu trữ của bạn. Máy chủ từ xa thường cung cấp một mức độ tài nguyên tính toán được đảm bảo (ví dụ: CPU, RAM, bộ nhớ lưu trữ, v.v.) và kết nối Internet với một mức giá nhất định.

Loại phần cứng máy tính/mạng có thể truy cập từ xa này được gọi là _Infrastructure as a Service (IaaS)_. Nhiều nhà cung cấp IaaS cung cấp tùy chọn để cài đặt sẵn một hệ điều hành cụ thể, mà sau đó bạn phải cài đặt các thành phần khác của môi trường sản xuất. Các nhà cung cấp khác cho phép bạn chọn các môi trường đầy đủ tính năng hơn, có thể bao gồm thiết lập Node hoàn chỉnh.

> [!NOTE]
> Các môi trường được xây dựng sẵn có thể giúp việc thiết lập trang web của bạn dễ dàng hơn vì chúng giảm bớt cấu hình cần thiết, nhưng các tùy chọn có sẵn có thể giới hạn bạn với một máy chủ không quen thuộc (hoặc các thành phần khác) và có thể dựa trên phiên bản HĐH cũ hơn. Thường thì tốt hơn khi tự cài đặt các thành phần để bạn có thể nhận được những thứ bạn muốn, và khi bạn cần nâng cấp các phần của hệ thống, bạn có ý tưởng về nơi để bắt đầu!

Các nhà cung cấp lưu trữ khác hỗ trợ Express như một phần của dịch vụ _Platform as a Service_ (_PaaS_). Khi sử dụng loại lưu trữ này, bạn không cần lo lắng về hầu hết môi trường sản xuất của mình (máy chủ, bộ cân bằng tải, v.v.) vì nền tảng lưu trữ lo điều đó cho bạn. Điều đó làm cho việc triển khai khá đơn giản vì bạn chỉ cần tập trung vào ứng dụng web của mình và không cần bất kỳ cơ sở hạ tầng máy chủ nào khác.

Một số nhà phát triển sẽ chọn sự linh hoạt tăng lên do IaaS cung cấp so với PaaS, trong khi những người khác sẽ đánh giá cao chi phí bảo trì giảm và khả năng mở rộng dễ dàng hơn của PaaS. Khi bạn bắt đầu, việc thiết lập trang web của bạn trên một hệ thống PaaS sẽ dễ dàng hơn nhiều, vì vậy đó là những gì chúng ta sẽ làm trong hướng dẫn này.

> [!NOTE]
> Nếu bạn chọn nhà cung cấp lưu trữ thân thiện với Node/Express, họ nên cung cấp hướng dẫn về cách thiết lập trang web Express bằng các cấu hình máy chủ web, máy chủ ứng dụng, reverse proxy, v.v. khác nhau. Ví dụ, có nhiều hướng dẫn từng bước cho các cấu hình khác nhau trong [tài liệu cộng đồng Node DigitalOcean](https://www.digitalocean.com/community/tutorials?q=node).

## Chọn nhà cung cấp lưu trữ

Có nhiều nhà cung cấp lưu trữ được biết đến là hỗ trợ hoặc hoạt động tốt với _Node_ (và _Express_). Các nhà cung cấp này cung cấp các loại môi trường khác nhau (IaaS, PaaS), và các mức độ tài nguyên tính toán và mạng khác nhau ở các mức giá khác nhau.

> [!NOTE]
> Có nhiều giải pháp lưu trữ, và các dịch vụ và giá cả của chúng có thể thay đổi theo thời gian. Trong khi chúng ta giới thiệu một vài lựa chọn dưới đây, đáng để kiểm tra cả những lựa chọn này và các lựa chọn khác trước khi chọn nhà cung cấp lưu trữ.

Một số điều cần xem xét khi chọn nhà cung cấp:

- Trang web của bạn có thể bận như thế nào và chi phí tài nguyên dữ liệu và tính toán cần thiết để đáp ứng nhu cầu đó.
- Mức độ hỗ trợ cho việc mở rộng theo chiều ngang (thêm máy) và theo chiều dọc (nâng cấp lên máy mạnh hơn) và chi phí của việc làm như vậy.
- Các vị trí nơi nhà cung cấp có trung tâm dữ liệu, và do đó nơi truy cập có thể nhanh nhất.
- Hiệu suất thời gian hoạt động và ngừng hoạt động lịch sử của nhà cung cấp.
- Các công cụ được cung cấp để quản lý trang web — chúng có dễ sử dụng và an toàn không (ví dụ: SFTP vs. FTP).
- Các framework tích hợp để theo dõi máy chủ của bạn.
- Các hạn chế đã biết. Một số nhà cung cấp sẽ cố tình chặn một số dịch vụ nhất định (ví dụ: email). Những nhà cung cấp khác chỉ cung cấp một số giờ "thời gian sống" nhất định trong một số mức giá, hoặc chỉ cung cấp một lượng lưu trữ nhỏ.
- Các lợi ích bổ sung. Một số nhà cung cấp sẽ cung cấp tên miền miễn phí và hỗ trợ cho chứng chỉ TLS mà bạn sẽ phải trả tiền.
- Liệu tầng "miễn phí" bạn đang dựa vào có hết hạn theo thời gian không, và liệu chi phí di chuyển sang tầng đắt tiền hơn có nghĩa là bạn đã nên sử dụng dịch vụ khác ngay từ đầu!

Tin tốt khi bạn bắt đầu là có khá nhiều trang web cung cấp môi trường tính toán "miễn phí" dành cho đánh giá và kiểm thử.
Chúng thường là các môi trường bị hạn chế/giới hạn tài nguyên, và bạn cần biết rằng chúng có thể hết hạn sau một thời gian giới thiệu hoặc có các hạn chế khác.
Tuy nhiên chúng rất tốt để kiểm thử các trang web ít lưu lượng trong môi trường lưu trữ, và có thể cung cấp việc di chuyển dễ dàng sang việc trả tiền cho nhiều tài nguyên hơn khi trang web của bạn trở nên bận hơn.
Các lựa chọn phổ biến trong danh mục này bao gồm [Amazon Web Services](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-free-tier.html) và [Microsoft Azure](https://azure.microsoft.com/en-us/pricing/details/app-service/linux/).

Hầu hết các nhà cung cấp cũng cung cấp tầng "cơ bản" hoặc "hobby" dành cho các trang web sản xuất nhỏ, và cung cấp các mức sức mạnh tính toán hữu ích hơn và ít hạn chế hơn.
[Railway](https://railway.com/), [Heroku](https://www.heroku.com/), và [DigitalOcean](https://www.digitalocean.com/) là các ví dụ về nhà cung cấp lưu trữ phổ biến có tầng tính toán cơ bản tương đối rẻ (trong khoảng 5 đến 10 USD mỗi tháng).

> [!NOTE]
> Hãy nhớ rằng giá cả không phải là tiêu chí chọn lựa duy nhất.
> Nếu trang web của bạn thành công, có thể hóa ra khả năng mở rộng là yếu tố quan trọng nhất.

## Chuẩn bị trang web của bạn để xuất bản

Những điều chính cần suy nghĩ khi xuất bản trang web của bạn là bảo mật web và hiệu suất.
Ở mức tối thiểu, bạn sẽ muốn sửa đổi cấu hình cơ sở dữ liệu để bạn có thể sử dụng cơ sở dữ liệu khác cho môi trường sản xuất và bảo mật thông tin xác thực của nó, xóa các stack traces được bao gồm trên các trang lỗi trong quá trình phát triển, dọn dẹp nhật ký của bạn, và đặt các header thích hợp để tránh nhiều mối đe dọa bảo mật phổ biến.

Trong các phần con sau, chúng ta trình bày những thay đổi quan trọng nhất mà bạn nên thực hiện cho ứng dụng của mình.

> [!NOTE]
> Có các gợi ý hữu ích khác trong tài liệu Express — xem [Thực hành tốt nhất trong sản xuất: hiệu suất và độ tin cậy](https://expressjs.com/en/advanced/best-practice-performance.html) và [Thực hành tốt nhất trong sản xuất: Bảo mật](https://expressjs.com/en/advanced/best-practice-security.html).

### Cấu hình cơ sở dữ liệu

Cho đến nay trong hướng dẫn này, chúng ta đã sử dụng một cơ sở dữ liệu phát triển duy nhất, trong đó địa chỉ và thông tin xác thực đã được [mã hóa cứng vào **bin/www**](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose#connect_to_mongodb).
Vì cơ sở dữ liệu phát triển không chứa bất kỳ thông tin nào mà chúng ta lo ngại bị lộ hoặc bị hỏng, không có rủi ro cụ thể nào khi rò rỉ những chi tiết này.
Tuy nhiên nếu bạn đang làm việc với dữ liệu thực, đặc biệt là thông tin người dùng cá nhân, thì việc bảo vệ thông tin xác thực cơ sở dữ liệu của bạn là rất quan trọng.

Vì lý do này, chúng ta muốn sử dụng cơ sở dữ liệu khác cho môi trường sản xuất so với môi trường phát triển, và cũng giữ thông tin xác thực cơ sở dữ liệu sản xuất tách biệt khỏi mã nguồn để chúng có thể được bảo vệ đúng cách.

Nếu nhà cung cấp lưu trữ của bạn hỗ trợ đặt biến môi trường qua giao diện web (như nhiều nhà cung cấp làm), một cách để thực hiện điều này là để máy chủ lấy URL cơ sở dữ liệu từ một biến môi trường.
Dưới đây chúng ta sửa đổi trang web LocalLibrary để lấy URI cơ sở dữ liệu từ một biến môi trường HĐH, nếu nó đã được định nghĩa, và nếu không thì sử dụng URL cơ sở dữ liệu phát triển.

Mở tệp **bin.www** và tìm dòng đặt biến kết nối MongoDB.
Nó sẽ trông giống như thế này:

```js
const mongoDB =
  "mongodb+srv://your_user_name:your_password@cluster0.cojoign.mongodb.net/local_library?retryWrites=true&w=majority";
```

Thay thế dòng bằng đoạn mã sau sử dụng `process.env.MONGODB_URI` để lấy chuỗi kết nối từ một biến môi trường có tên `MONGODB_URI` nếu nó đã được đặt (sử dụng URL cơ sở dữ liệu của riêng bạn thay vì placeholder dưới đây).

```js
const dev_db_url =
  "mongodb+srv://your_user_name:your_password@cluster0.cojoign.mongodb.net/local_library?retryWrites=true&w=majority";
const mongoDB = process.env.MONGODB_URI || dev_db_url;
```

> [!NOTE]
> Một cách phổ biến khác để giữ thông tin xác thực cơ sở dữ liệu sản xuất tách biệt khỏi mã nguồn là đọc chúng từ tệp `.env` được triển khai riêng đến hệ thống tệp (ví dụ, chúng có thể được đọc sử dụng module [dotenv](https://www.npmjs.com/package/dotenv) từ npm).

### Đặt NODE_ENV thành 'production'

Chúng ta có thể xóa stack traces trong các trang lỗi bằng cách đặt biến môi trường `NODE_ENV` thành _production_ (nó được đặt thành '_development_' theo mặc định). Ngoài việc tạo ra các thông báo lỗi ít chi tiết hơn, việc đặt biến thành _production_ sẽ lưu vào bộ nhớ đệm các template view và các tệp CSS được tạo từ các phần mở rộng CSS. Các bài kiểm tra cho thấy rằng việc đặt `NODE_ENV` thành _production_ có thể cải thiện hiệu suất ứng dụng lên ba lần!

Thay đổi này có thể được thực hiện bằng cách sử dụng `export`, tệp môi trường, hoặc hệ thống khởi tạo HĐH.

> [!NOTE]
> Đây thực ra là thay đổi bạn thực hiện trong cài đặt môi trường của bạn hơn là trong ứng dụng, nhưng đủ quan trọng để lưu ý ở đây! Chúng ta sẽ hướng dẫn cách đặt điều này cho ví dụ lưu trữ của mình bên dưới.

### Ghi nhật ký hợp lý

Các lời gọi ghi nhật ký có thể ảnh hưởng đến một trang web có lưu lượng cao. Trong môi trường sản xuất, bạn có thể cần ghi nhật ký hoạt động trang web (ví dụ: theo dõi lưu lượng hoặc ghi nhật ký các lời gọi API) nhưng bạn nên cố gắng giảm thiểu lượng nhật ký được thêm vào cho mục đích gỡ lỗi.

Một cách để giảm thiểu ghi nhật ký "debug" trong môi trường sản xuất là sử dụng module như [debug](https://www.npmjs.com/package/debug) cho phép bạn kiểm soát những gì được ghi nhật ký bằng cách đặt một biến môi trường.
Ví dụ, đoạn mã dưới đây cho thấy cách bạn có thể thiết lập ghi nhật ký "author".
Biến debug được khai báo với tên 'author', và tiền tố "author" sẽ được tự động hiển thị cho tất cả nhật ký từ đối tượng này.

```js
const debug = require("debug")("author");

// Display Author update form on GET.
exports.author_update_get = async (req, res, next) => {
  const author = await Author.findById(req.params.id).exec();
  if (author === null) {
    // No results.
    debug(`id not found on update: ${req.params.id}`);
    const err = new Error("Author not found");
    err.status = 404;
    return next(err);
  }

  res.render("author_form", { title: "Update Author", author });
};
```

Sau đó bạn có thể bật một tập hợp nhật ký cụ thể bằng cách chỉ định chúng như một danh sách phân cách bằng dấu phẩy trong biến môi trường `DEBUG`.
Bạn có thể đặt các biến để hiển thị nhật ký tác giả và sách như được hiển thị (các ký tự đại diện cũng được hỗ trợ).

```bash
#Windows
set DEBUG=author,book

#Linux
export DEBUG="author,book"
```

> [!NOTE]
> Các lời gọi đến `debug` có thể thay thế ghi nhật ký mà bạn có thể đã thực hiện trước đây bằng `console.log()` hoặc `console.error()`. Thay thế bất kỳ lời gọi `console.log()` nào trong mã của bạn bằng ghi nhật ký thông qua module [debug](https://www.npmjs.com/package/debug). Bật và tắt ghi nhật ký trong môi trường phát triển của bạn bằng cách đặt biến DEBUG và quan sát tác động này đối với việc ghi nhật ký.

Nếu bạn cần ghi nhật ký hoạt động trang web, bạn có thể sử dụng thư viện ghi nhật ký như _Winston_ hoặc _Bunyan_. Để biết thêm thông tin về chủ đề này, xem: [Thực hành tốt nhất trong sản xuất: hiệu suất và độ tin cậy](https://expressjs.com/en/advanced/best-practice-performance.html).

### Sử dụng nén gzip/deflate cho các phản hồi

Các máy chủ web thường có thể nén phản hồi HTTP được gửi lại cho máy khách, giảm đáng kể thời gian cần thiết để máy khách nhận và tải trang. Phương thức nén được sử dụng sẽ phụ thuộc vào các phương thức giải nén mà máy khách nói nó hỗ trợ trong yêu cầu (phản hồi sẽ được gửi không nén nếu không có phương thức nén nào được hỗ trợ).

Thêm điều này vào trang web của bạn sử dụng middleware [compression](https://www.npmjs.com/package/compression). Cài đặt tại thư mục gốc của dự án bằng cách chạy lệnh sau:

```bash
npm install compression
```

Mở tệp **./app.js** và yêu cầu thư viện compression như được hiển thị. Thêm thư viện compression vào chuỗi middleware bằng phương thức `use()` (điều này nên xuất hiện trước bất kỳ tuyến đường nào bạn muốn nén — trong trường hợp này, tất cả chúng!)

```js
const catalogRouter = require("./routes/catalog"); // Import routes for "catalog" area of site
const compression = require("compression");

// Create the Express application object
const app = express();

// …

app.use(compression()); // Compress all routes

app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/catalog", catalogRouter); // Add catalog routes to middleware chain.

// …
```

> [!NOTE]
> Đối với một trang web có lưu lượng cao trong môi trường sản xuất, bạn sẽ không sử dụng middleware này. Thay vào đó, bạn sẽ sử dụng reverse proxy như [Nginx](https://nginx.org/).

### Sử dụng Helmet để bảo vệ chống lại các lỗ hổng đã biết

[Helmet](https://www.npmjs.com/package/helmet) là một gói middleware. Nó có thể đặt các HTTP header thích hợp giúp bảo vệ ứng dụng của bạn khỏi các lỗ hổng web đã biết (xem [tài liệu](https://helmetjs.github.io/) để biết thêm thông tin về những header nó đặt và các lỗ hổng nó bảo vệ chống lại).

Cài đặt tại thư mục gốc của dự án bằng cách chạy lệnh sau:

```bash
npm install helmet
```

Mở tệp **./app.js** và yêu cầu thư viện _helmet_ như được hiển thị.
Sau đó thêm module vào chuỗi middleware bằng phương thức `use()`.

```js
const compression = require("compression");
const helmet = require("helmet");

// Create the Express application object
const app = express();

// Add helmet to the middleware chain.
// Set CSP headers to allow our Bootstrap and jQuery to be served
app.use(
  helmet.contentSecurityPolicy({
    directives: {
      "script-src": ["'self'", "cdn.jsdelivr.net"],
    },
  }),
);

// …
```

Thông thường chúng ta chỉ có thể chèn `app.use(helmet());` để thêm _tập con_ các header liên quan đến bảo mật có ý nghĩa cho hầu hết các trang web.
Tuy nhiên trong [mẫu cơ sở LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/LocalLibrary_base_template) chúng ta bao gồm một số script bootstrap.
Những script này vi phạm [Chính sách Bảo mật Nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) _mặc định_ của helmet, không cho phép tải script từ trang web chéo.
Để cho phép các script này được tải, chúng ta sửa đổi cấu hình helmet để nó đặt các chỉ thị CSP cho phép tải script từ các tên miền được chỉ định.
Đối với máy chủ của riêng bạn, bạn có thể thêm/vô hiệu hóa các header cụ thể khi cần bằng cách làm theo [hướng dẫn sử dụng helmet tại đây](https://www.npmjs.com/package/helmet).

### Thêm giới hạn tốc độ cho các tuyến đường API

[Express-rate-limit](https://www.npmjs.com/package/express-rate-limit) là một gói middleware có thể được sử dụng để giới hạn các yêu cầu lặp lại đến các API và điểm cuối.
Có nhiều lý do tại sao các yêu cầu quá mức có thể được thực hiện đến trang web của bạn, chẳng hạn như các cuộc tấn công từ chối dịch vụ, tấn công brute force, hoặc thậm chí chỉ là một máy khách hoặc script không hoạt động như mong đợi.
Ngoài các vấn đề hiệu suất có thể phát sinh từ quá nhiều yêu cầu gây ra máy chủ của bạn chậm lại, bạn cũng có thể bị tính phí cho lưu lượng bổ sung.
Gói này có thể được sử dụng để giới hạn số lượng yêu cầu có thể được thực hiện đến một tuyến đường cụ thể hoặc tập hợp tuyến đường.

Cài đặt tại thư mục gốc của dự án bằng cách chạy lệnh sau:

```bash
npm install express-rate-limit
```

Mở tệp **./app.js** và yêu cầu thư viện _express-rate-limit_ như được hiển thị.
Sau đó thêm module vào chuỗi middleware bằng phương thức `use()`.

```js
const compression = require("compression");
const helmet = require("helmet");
const RateLimit = require("express-rate-limit");

const app = express();

// Set up rate limiter: maximum of twenty requests per minute
const limiter = RateLimit({
  windowMs: 1 * 60 * 1000, // 1 minute
  max: 20,
});
// Apply rate limiter to all requests
app.use(limiter);

// …
```

Lệnh trên giới hạn tất cả các yêu cầu xuống 20 mỗi phút (bạn có thể thay đổi điều này khi cần).

> [!NOTE]
> Các dịch vụ bên thứ ba như [Cloudflare](https://www.cloudflare.com/) cũng có thể được sử dụng nếu bạn cần bảo vệ nâng cao hơn chống lại từ chối dịch vụ hoặc các loại tấn công khác.

#### Đặt phiên bản node

Đối với các ứng dụng node, bao gồm Express, tệp **package.json** chứa mọi thứ nhà cung cấp lưu trữ cần để tìm ra các phụ thuộc ứng dụng và tệp điểm vào.

Thông tin quan trọng duy nhất còn thiếu trong **package.json** hiện tại của chúng ta là phiên bản node cần thiết cho thư viện.
Bạn có thể tìm thấy phiên bản node được sử dụng cho phát triển bằng cách nhập lệnh:

```bash
>node --version
v16.17.1
```

Mở **package.json**, và thêm thông tin này như một **engines > node** như được hiển thị (sử dụng số phiên bản cho hệ thống của bạn).

```json
{
  "engines": {
    "node": ">=22.0.0"
  }
}
```

Dịch vụ lưu trữ có thể không hỗ trợ phiên bản node được chỉ định cụ thể, nhưng thay đổi này nên đảm bảo rằng nó cố gắng sử dụng một phiên bản có cùng số phiên bản chính, hoặc phiên bản mới hơn.

Lưu ý rằng có thể có các cách khác để chỉ định phiên bản node trên các dịch vụ lưu trữ khác nhau, nhưng cách tiếp cận **package.json** được hỗ trợ rộng rãi.

#### Lấy các phụ thuộc và kiểm thử lại

Trước khi tiến hành, hãy kiểm thử lại trang web và đảm bảo nó không bị ảnh hưởng bởi bất kỳ thay đổi nào của chúng ta.

Đầu tiên, chúng ta sẽ cần lấy các phụ thuộc của mình. Bạn có thể làm điều này bằng cách chạy lệnh sau trong terminal tại thư mục gốc của dự án:

```bash
npm install
```

Bây giờ chạy trang web (xem [Kiểm thử các tuyến đường](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes#testing_the_routes) cho các lệnh có liên quan) và kiểm tra xem trang web vẫn hoạt động như bạn mong đợi.

### Tạo kho lưu trữ ứng dụng trên GitHub

Nhiều dịch vụ lưu trữ cho phép bạn import và/hoặc đồng bộ hóa các dự án từ kho lưu trữ cục bộ hoặc từ các nền tảng quản lý phiên bản nguồn dựa trên đám mây.
Điều này có thể làm cho việc triển khai và phát triển lặp lại dễ dàng hơn nhiều.

Trong hướng dẫn này, chúng ta sẽ thiết lập tài khoản và kho lưu trữ [GitHub](https://github.com/) cho thư viện, và sử dụng công cụ **git** để tải lên mã nguồn của chúng ta.

> [!NOTE]
> Bạn có thể bỏ qua bước này nếu bạn đã sử dụng GitHub để quản lý mã nguồn của mình!
>
> Lưu ý rằng việc sử dụng các công cụ quản lý mã nguồn là thực hành phát triển phần mềm tốt, vì nó cho phép bạn thử các thay đổi, và chuyển đổi giữa các thử nghiệm và "mã tốt đã biết" khi bạn cần!

Các bước là:

1. Truy cập <https://github.com/> và tạo tài khoản.
2. Sau khi đăng nhập, nhấp vào liên kết **+** trên thanh công cụ trên cùng và chọn **New repository**.
3. Điền tất cả các trường trên biểu mẫu này. Trong khi những điều này không bắt buộc, chúng được khuyến nghị mạnh mẽ.
   - Nhập tên kho lưu trữ mới (ví dụ: _express-locallibrary-tutorial_), và mô tả (chẳng hạn như "Trang web Thư viện Cục bộ được viết bằng Express").
   - Chọn **Node** trong danh sách chọn _Add .gitignore_.
   - Chọn giấy phép ưa thích của bạn trong danh sách chọn _Add license_.
   - Chọn **Initialize this repository with a README**.

   > [!WARNING]
   > Quyền truy cập "Public" mặc định sẽ làm cho _tất cả_ mã nguồn — bao gồm tên người dùng và mật khẩu cơ sở dữ liệu của bạn — hiển thị với bất kỳ ai trên internet! Hãy chắc chắn rằng mã nguồn đọc thông tin xác thực _chỉ_ từ các biến môi trường và không có thông tin xác thực nào được mã hóa cứng.
   >
   > Nếu không, hãy chọn tùy chọn "Private" để chỉ cho phép những người được chọn xem mã nguồn.

4. Nhấn **Create repository**.
5. Nhấp vào nút **Clone or download** màu xanh lá trên trang kho lưu trữ mới của bạn.
6. Sao chép giá trị URL từ trường văn bản bên trong hộp thoại xuất hiện.
   Nếu bạn sử dụng tên kho lưu trữ "express-locallibrary-tutorial", URL sẽ giống như: `https://github.com/<your_git_user_id>/express-locallibrary-tutorial.git`.

Bây giờ kho lưu trữ ("repo") đã được tạo trên GitHub, chúng ta sẽ muốn clone (sao chép) nó vào máy tính cục bộ của chúng ta:

1. Cài đặt _git_ cho máy tính cục bộ của bạn ([hướng dẫn tải xuống Git chính thức](https://git-scm.com/downloads/)).
2. Mở command prompt/terminal và clone kho lưu trữ của bạn bằng URL bạn đã sao chép ở trên:

   ```bash
   git clone https://github.com/<your_git_user_id>/express-locallibrary-tutorial.git
   ```

   Điều này sẽ tạo kho lưu trữ bên trong thư mục hiện tại.

3. Điều hướng vào thư mục repo.

   ```bash
   cd express-locallibrary-tutorial
   ```

Sau đó sao chép các tệp nguồn ứng dụng của bạn vào thư mục repo, đưa chúng vào repo bằng _git_, và tải chúng lên GitHub:

1. Sao chép ứng dụng Express của bạn vào thư mục này (loại trừ **/node_modules**, chứa các tệp phụ thuộc mà bạn nên lấy từ npm khi cần).
2. Mở command prompt/terminal và sử dụng lệnh `add` để thêm tất cả các tệp vào git.

   ```bash
   git add -A
   ```

3. Sử dụng lệnh `status` để kiểm tra tất cả các tệp bạn sắp `commit` có đúng không (bạn muốn bao gồm các tệp nguồn, không phải nhị phân, tệp tạm thời v.v.).
   Nó trông giống như liệt kê dưới đây.

   ```bash
   git status
   ```

   ```plain
   On branch main
   Your branch is up-to-date with 'origin/main'.
   Changes to be committed:
     (use "git reset HEAD <file>..." to unstage)

           new file:   ...
   ```

4. Khi bạn hài lòng, `commit` các tệp vào kho lưu trữ cục bộ của bạn.
   Điều này tương đương với việc ký xác nhận các thay đổi và làm cho chúng trở thành phần chính thức của kho lưu trữ cục bộ.

   ```bash
   git commit -m "First version of application moved into GitHub"
   ```

5. Tại thời điểm này, kho lưu trữ từ xa chưa được thay đổi.
   Bước cuối cùng là đồng bộ hóa (`push`) kho lưu trữ cục bộ của bạn lên kho lưu trữ GitHub từ xa bằng lệnh sau:

   ```bash
   git push origin main
   ```

Khi thao tác này hoàn tất, bạn có thể quay lại trang trên GitHub nơi bạn tạo kho lưu trữ của mình, làm mới trang, và xem toàn bộ ứng dụng của bạn đã được tải lên. Bạn có thể tiếp tục cập nhật kho lưu trữ khi tệp thay đổi bằng chu kỳ add/commit/push này.

Đây là thời điểm tốt để tạo bản sao lưu dự án "vanilla" của bạn — trong khi một số thay đổi mà chúng ta sắp thực hiện trong các phần sau đây có thể hữu ích cho việc triển khai trên bất kỳ dịch vụ lưu trữ nào (hoặc để phát triển), những thay đổi khác có thể không.
Bạn có thể làm điều này bằng `git` trên command line:

```bash
# Create branch vanilla_deployment from the current branch (main)
git checkout -b vanilla_deployment

# Push the new branch to GitHub
git push origin vanilla_deployment

# Switch back to main
git checkout main

# Make any further changes in a new branch
git pull upstream main # Merge the latest changes from GitHub
git checkout -b my_changes # Create a new branch
```

> [!NOTE]
> Git rất mạnh mẽ!
> Để tìm hiểu thêm, xem [Học Git](https://docs.github.com/en/get-started/start-your-journey/git-and-github-learning-resources).

## Ví dụ: Lưu trữ trên Railway

Phần này cung cấp một minh họa thực tế về cách cài đặt _LocalLibrary_ trên [Railway](https://railway.com/).

> [!NOTE]
> MDN đã di chuyển dự án này từ một số dịch vụ lưu trữ không còn cung cấp tầng miễn phí nữa.
> Chúng tôi đã quyết định sử dụng Railway cho tùy chọn lưu trữ hiện tại, có tầng hobby giá cả phải chăng.
> Hầu hết các dịch vụ có phương pháp triển khai tương tự, vì vậy hướng dẫn dưới đây nên giúp bạn xuất bản dự án trên nền tảng bạn chọn.

### Tại sao Railway?

Railway là một tùy chọn lưu trữ hấp dẫn vì một số lý do:

- Railway lo hầu hết cơ sở hạ tầng để bạn không phải làm.
  Không phải lo lắng về máy chủ, bộ cân bằng tải, reverse proxy, v.v. giúp bắt đầu dễ dàng hơn nhiều.
- Railway có [trọng tâm vào trải nghiệm nhà phát triển cho phát triển và triển khai](https://docs.railway.com/platform/compare-to-heroku), dẫn đến đường cong học tập nhanh hơn và mượt mà hơn so với nhiều lựa chọn thay thế khác.
- Các kỹ năng và khái niệm bạn sẽ học khi sử dụng Railway có thể chuyển giao được.
  Trong khi Railway có một số tính năng mới tuyệt vời, các dịch vụ lưu trữ phổ biến khác sử dụng nhiều ý tưởng và cách tiếp cận tương tự.
- [Tài liệu Railway](https://docs.railway.com/) rõ ràng và đầy đủ.
- Nó có [Tầng Hobby](https://railway.com/pricing) so sánh được giá cả phải chăng.
- Dịch vụ có vẻ rất đáng tin cậy, và nếu bạn yêu thích nó, giá cả có thể dự đoán được, và việc mở rộng ứng dụng của bạn rất dễ dàng.

Bạn nên dành thời gian để xác định xem Railway có [phù hợp cho trang web của riêng bạn](#choosing_a_hosting_provider) hay không.

### Railway hoạt động như thế nào?

Các ứng dụng web mỗi cái đều chạy trong container ảo hóa riêng biệt và độc lập.
Để thực thi ứng dụng của bạn, Railway cần có khả năng thiết lập môi trường và phụ thuộc thích hợp, và cũng hiểu cách nó được khởi chạy.

Railway làm điều này dễ dàng, vì nó có thể tự động nhận ra và cài đặt nhiều framework và môi trường ứng dụng web khác nhau dựa trên việc sử dụng "quy ước phổ biến" của chúng.
Ví dụ, Railway nhận ra các ứng dụng node vì chúng có tệp **package.json**, và có thể xác định trình quản lý gói được sử dụng để xây dựng từ tệp "lock".
Ví dụ, nếu ứng dụng bao gồm tệp **package-lock.json**, Railway biết sử dụng _npm_ để cài đặt các gói, trong khi nếu nó tìm thấy **yarn.lock**, nó biết sử dụng _yarn_.
Sau khi cài đặt tất cả các phụ thuộc, Railway sẽ tìm kiếm các script có tên "build" và "start" trong tệp package, và sử dụng chúng để xây dựng và chạy mã.

> [!NOTE]
> Railway sử dụng [Nixpacks](https://nixpacks.com/docs) để nhận ra các framework ứng dụng web khác nhau được viết bằng các ngôn ngữ lập trình khác nhau.
> Bạn không cần biết gì khác cho hướng dẫn này, nhưng bạn có thể tìm hiểu thêm về các tùy chọn để triển khai các ứng dụng node trong [Nixpacks Node](https://nixpacks.com/docs/providers/node).

Sau khi ứng dụng đang chạy, nó có thể tự cấu hình bằng cách sử dụng thông tin được cung cấp trong [các biến môi trường](https://docs.railway.com/variables).
Ví dụ, một ứng dụng sử dụng cơ sở dữ liệu phải lấy địa chỉ bằng một biến.
Chính dịch vụ cơ sở dữ liệu có thể được lưu trữ bởi Railway hoặc một số nhà cung cấp khác.

Các nhà phát triển tương tác với Railway thông qua trang web Railway, và sử dụng công cụ [Command Line Interface (CLI)](https://docs.railway.com/cli) đặc biệt.
CLI cho phép bạn liên kết kho lưu trữ GitHub cục bộ với một dự án railway, tải lên kho lưu trữ từ nhánh cục bộ lên trang web live, kiểm tra nhật ký của quy trình đang chạy, đặt và lấy các biến cấu hình và nhiều hơn nữa.
Một trong những tính năng hữu ích nhất là bạn có thể sử dụng CLI để chạy dự án cục bộ của mình với cùng biến môi trường như dự án live.

Đó là tất cả tổng quan bạn cần để triển khai ứng dụng lên Railway.
Tiếp theo chúng ta sẽ thiết lập tài khoản Railway, cài đặt trang web và cơ sở dữ liệu của chúng ta, và thử client Railway.

### Tạo tài khoản Railway

Để bắt đầu sử dụng Railway, trước tiên bạn cần tạo tài khoản:

- Truy cập [railway.com](https://railway.com/) và nhấp vào liên kết **Login** trên thanh công cụ trên cùng.
- Chọn GitHub trong popup để đăng nhập bằng thông tin xác thực GitHub của bạn
- Sau đó bạn có thể cần vào email và xác minh tài khoản của bạn.
- Sau đó bạn sẽ được đăng nhập vào dashboard Railway.com: <https://railway.com/dashboard>.

### Triển khai trên Railway từ GitHub

Tiếp theo chúng ta sẽ thiết lập Railway để triển khai thư viện của chúng ta từ GitHub.
Đầu tiên chọn tùy chọn **Dashboard** từ menu trên cùng của trang web, sau đó chọn nút **New Project**:

![Railway website dashboard showing new project button](railway_new_project_button.png)

Railway sẽ hiển thị danh sách các tùy chọn cho dự án mới, bao gồm tùy chọn triển khai dự án từ một template được tạo đầu tiên trong tài khoản GitHub của bạn, và một số cơ sở dữ liệu.
Chọn **Deploy from GitHub repo**.

![Railway popup showing deployment options with Deploy from GitHub repo option highlighted](railway_new_project_button_deploy_github_repo.png)

Tất cả các dự án trong các repos GitHub bạn đã chia sẻ với Railway trong quá trình thiết lập sẽ được hiển thị.
Chọn kho lưu trữ GitHub của bạn cho thư viện cục bộ: `<user-name>/express-locallibrary-tutorial`.

![Railway popup showing GitHub repos that can be deployed](railway_new_project_button_deploy_github_selectrepo.png)

Xác nhận triển khai của bạn bằng cách chọn **Deploy Now**.

![Confirmation screen when you can select deployment of project](railway_new_project_deploy_confirm.png)

Railway sau đó sẽ tải và triển khai dự án của bạn, hiển thị tiến trình trên tab deployments.
Khi triển khai hoàn thành thành công, bạn sẽ thấy màn hình như bên dưới.

![Railway dashboard showing Deployments tab for the deployed project](railway_project_deploy.png)

Bây giờ chọn tab _Settings_, sau đó cuộn xuống phần Domains, và nhấn nút **Generate Domain**.

![Railway project settings tab showing button to generate a domain](railway_project_generate_domain.png)

Điều này sẽ xuất bản trang web và đặt tên miền vào vị trí của nút, như được hiển thị dưới đây.

![Railway project settings tab showing a link to the local library site](railway_project_domain.png)

Chọn URL tên miền để mở ứng dụng thư viện của bạn.
Lưu ý rằng vì chúng ta chưa chỉ định cơ sở dữ liệu sản xuất, thư viện cục bộ sẽ mở bằng dữ liệu phát triển của bạn.

### Cung cấp và kết nối cơ sở dữ liệu MongoDB

Thay vì sử dụng dữ liệu phát triển của chúng ta, tiếp theo hãy tạo cơ sở dữ liệu MongoDB sản xuất để sử dụng thay thế.
Chúng ta sẽ tạo cơ sở dữ liệu như một phần của dự án ứng dụng Railway, mặc dù không có gì ngăn bạn tạo trong dự án riêng biệt của nó, hoặc thực sự sử dụng cơ sở dữ liệu _MongoDB Atlas_ cho dữ liệu sản xuất, giống như bạn đã làm cho cơ sở dữ liệu phát triển.

Trên Railway, chọn tùy chọn **Dashboard** từ menu trên cùng của trang web sau đó chọn dự án ứng dụng của bạn.
Ở giai đoạn này nó chỉ chứa một dịch vụ duy nhất cho ứng dụng của bạn (điều này có thể được chọn để đặt các biến và các chi tiết khác của dịch vụ).
Chọn nút **New**, được sử dụng để thêm dịch vụ vào dự án hiện tại.

![Railway project with new service button highlighted](railway_project_open_no_database.png)

Chọn **Database** khi được nhắc về loại dịch vụ cần thêm:

![Railway popup showing options for a new service, such as database, GitHub repo, empty service etc](railway_database_add.png)

Sau đó chọn **Add MongoDB** để bắt đầu thêm cơ sở dữ liệu

![Railway popup showing different databases that can be selected: Postgres, MySQL, MongoDB and so on](railway_database_select_type.png)

Railway sau đó sẽ cung cấp một dịch vụ chứa cơ sở dữ liệu trống trong cùng dự án.
Khi hoàn tất, bạn sẽ thấy cả dịch vụ ứng dụng và dịch vụ cơ sở dữ liệu trong chế độ xem dự án.

![Railway project with application and database services](railway_project_two_services.png)

Chọn dịch vụ MongoDB để hiển thị thông tin về cơ sở dữ liệu.
Mở tab _Variables_ và sao chép "Mongo_URL" (đây là địa chỉ của cơ sở dữ liệu).

![Railway database settings screen showing the URL needed to connect to the database](railway_mongodb_connect.png)

Để làm điều này có thể truy cập được đối với ứng dụng thư viện, chúng ta cần thêm nó vào quy trình ứng dụng bằng cách sử dụng một biến môi trường.
Đầu tiên mở dịch vụ ứng dụng.
Sau đó chọn tab _Variables_ và nhấn nút **New Variable**.

Nhập tên biến `MONGODB_URI` và URL kết nối bạn đã sao chép cho cơ sở dữ liệu (`MONGODB_URI` là tên của biến môi trường mà từ đó [chúng ta đã cấu hình ứng dụng](#database_configuration) để đọc địa chỉ cơ sở dữ liệu).
Điều này sẽ trông giống như màn hình được hiển thị dưới đây.

![Railway website variables screen while adding the MONGODB_URI variable and address](railway_variables_database_url.png)

Chọn **Add** để thêm biến.

Railway khởi động lại ứng dụng của bạn khi nó cập nhật các biến. Nếu bạn kiểm tra trang chủ bây giờ, nó sẽ hiển thị giá trị không cho số đếm đối tượng của bạn, vì các thay đổi ở trên có nghĩa là chúng ta đang sử dụng cơ sở dữ liệu mới (trống).

### Các biến cấu hình khác

Bạn sẽ nhớ lại từ phần trước rằng chúng ta cần [đặt NODE_ENV thành 'production'](#set_node_env_to_production) để cải thiện hiệu suất của chúng ta và tạo ra ít thông báo lỗi chi tiết hơn. Chúng ta có thể làm điều này trong cùng màn hình khi chúng ta đặt biến `MONGODB_URI`.

Mở dịch vụ ứng dụng.
Sau đó chọn tab _Variables_, nơi bạn sẽ thấy rằng `MONGODB_URI` đã được định nghĩa, và nhấn nút **New Variable**.

![Railway variables tab with the New Variable button highlighted](railway_variables_new.png)

Nhập `NODE_ENV` là tên của biến mới và `production` là tên của môi trường.
Sau đó nhấn nút **Add**.

![Railway variables tab with new NODE_ENV variable being set to 'production'](railway_variables_new_node_env.png)

Ứng dụng thư viện cục bộ bây giờ được thiết lập và cấu hình để sử dụng trong môi trường sản xuất.
Bạn có thể thêm dữ liệu thông qua giao diện trang web và nó sẽ hoạt động theo cách tương tự như trong quá trình phát triển (tuy nhiên với ít thông tin gỡ lỗi hơn được hiển thị cho các trang không hợp lệ).

> [!NOTE]
> Nếu bạn chỉ muốn thêm một số dữ liệu để kiểm thử, bạn có thể sử dụng script `populatedb` (với URL cơ sở dữ liệu MongoDB sản xuất của bạn) như đã thảo luận trong phần [Hướng dẫn Express Phần 3: Sử dụng Cơ sở dữ liệu (với Mongoose) Kiểm thử — tạo một số mục](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose#testing_%E2%80%94_create_some_items).

### Cài đặt client

Tải xuống và cài đặt Railway client cho hệ điều hành cục bộ của bạn bằng cách làm theo [hướng dẫn tại đây](https://docs.railway.com/cli).

Sau khi client được cài đặt, bạn sẽ có thể chạy các lệnh.
Một số hoạt động quan trọng hơn bao gồm triển khai thư mục hiện tại của máy tính bạn vào một dự án Railway liên kết (mà không cần tải lên GitHub), và chạy dự án cục bộ của bạn sử dụng cùng cài đặt như bạn có trên máy chủ sản xuất.

Bạn có thể lấy danh sách tất cả các lệnh có thể bằng cách nhập lệnh sau trong terminal.

```bash
railway help
```

### Gỡ lỗi

Railway client cung cấp lệnh logs để hiển thị đuôi nhật ký (nhật ký đầy đủ hơn có sẵn trên trang web cho mỗi dự án):

```bash
railway logs
```

## Tóm tắt

Đây là phần kết của hướng dẫn này về việc thiết lập các ứng dụng Express trong môi trường sản xuất, và cũng là loạt bài hướng dẫn về làm việc với Express. Chúng tôi hy vọng bạn thấy chúng hữu ích. Bạn có thể kiểm tra phiên bản đầy đủ của [mã nguồn trên GitHub tại đây](https://github.com/mdn/express-locallibrary-tutorial).

## Xem thêm

- [Thực hành tốt nhất trong sản xuất: hiệu suất và độ tin cậy](https://expressjs.com/en/advanced/best-practice-performance.html) (tài liệu Express)
- [Thực hành tốt nhất trong sản xuất: Bảo mật](https://expressjs.com/en/advanced/best-practice-security.html) (tài liệu Express)
- Tài liệu Railway
  - [CLI](https://docs.railway.com/cli)

- DigitalOcean
  - Hướng dẫn [Express](https://www.digitalocean.com/community/tutorials?q=express)
  - Hướng dẫn [Node.js](https://www.digitalocean.com/community/tutorials?q=node.js)

- Heroku
  - [Bắt đầu với Heroku bằng Node.js](https://devcenter.heroku.com/articles/getting-started-with-nodejs) (tài liệu Heroku)
  - [Triển khai ứng dụng Node.js trên Heroku](https://devcenter.heroku.com/articles/deploying-nodejs) (tài liệu Heroku)
  - [Hỗ trợ Heroku Node.js](https://devcenter.heroku.com/articles/nodejs-support) (tài liệu Heroku)
  - [Tối ưu hóa Đồng thời Ứng dụng Node.js](https://devcenter.heroku.com/articles/node-concurrency) (tài liệu Heroku)
  - [Heroku hoạt động như thế nào](https://devcenter.heroku.com/articles/how-heroku-works) (tài liệu Heroku)
  - [Dynos và Dyno Manager](https://devcenter.heroku.com/articles/dynos) (tài liệu Heroku)
  - [Cấu hình và Biến Cấu hình](https://devcenter.heroku.com/articles/config-vars) (tài liệu Heroku)
  - [Giới hạn](https://devcenter.heroku.com/articles/limits) (tài liệu Heroku)

{{PreviousMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/forms", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
