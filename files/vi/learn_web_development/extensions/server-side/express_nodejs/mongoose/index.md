---
title: "Hướng dẫn Express Phần 3: Sử dụng Cơ sở dữ liệu (với Mongoose)"
short-title: "3: Using databases with Mongoose"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs/routes", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Bài viết này giới thiệu ngắn gọn về cơ sở dữ liệu và cách sử dụng chúng với các ứng dụng Node/Express. Sau đó nó tiếp tục chỉ ra cách chúng tôi có thể sử dụng [Mongoose](https://mongoosejs.com/) để cung cấp quyền truy cập cơ sở dữ liệu cho trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website). Nó giải thích cách lược đồ đối tượng và các mô hình được khai báo, các loại trường chính và xác thực cơ bản. Nó cũng chỉ ra ngắn gọn một số cách chính để bạn có thể truy cập dữ liệu mô hình.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website">Hướng dẫn Express Phần 2: Tạo trang web khung</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Để có thể thiết kế và tạo các mô hình của riêng bạn bằng Mongoose.</td>
    </tr>
  </tbody>
</table>

## Tổng quan

Nhân viên thư viện sẽ sử dụng trang web Thư viện cục bộ để lưu trữ thông tin về sách và người mượn, trong khi các thành viên thư viện sẽ sử dụng nó để duyệt và tìm kiếm sách, tìm hiểu xem có bản sao nào có sẵn không và sau đó đặt trước hoặc mượn chúng. Để lưu trữ và truy xuất thông tin hiệu quả, chúng tôi sẽ lưu trữ nó trong một _cơ sở dữ liệu_.

Các ứng dụng Express có thể sử dụng nhiều loại cơ sở dữ liệu khác nhau và có một số cách tiếp cận bạn có thể sử dụng để thực hiện các hoạt động **T**ạo, **Đ**ọc, **C**ập nhật và **X**óa (CRUD). Hướng dẫn này cung cấp tổng quan ngắn về một số tùy chọn có sẵn và sau đó đi vào chi tiết các cơ chế cụ thể được chọn.

### Tôi có thể sử dụng cơ sở dữ liệu nào?

Các ứng dụng _Express_ có thể sử dụng bất kỳ cơ sở dữ liệu nào được _Node_ hỗ trợ (_Express_ bản thân không định nghĩa bất kỳ hành vi/yêu cầu bổ sung cụ thể nào cho quản lý cơ sở dữ liệu). Có [nhiều lựa chọn phổ biến](https://expressjs.com/en/guide/database-integration.html), bao gồm PostgreSQL, MySQL, Redis, SQLite và MongoDB.

Khi chọn cơ sở dữ liệu, bạn nên xem xét những thứ như thời gian đến năng suất/đường cong học tập, hiệu suất, tính dễ dàng của bản sao lưu/sao lưu, chi phí, hỗ trợ cộng đồng, v.v. Mặc dù không có cơ sở dữ liệu "tốt nhất" duy nhất, hầu hết bất kỳ giải pháp phổ biến nào cũng nên hơn đủ chấp nhận được cho trang web nhỏ đến trung bình như Thư viện cục bộ của chúng tôi.

Để biết thêm thông tin về các tùy chọn xem [Tích hợp cơ sở dữ liệu](https://expressjs.com/en/guide/database-integration.html) (Tài liệu Express).

### Cách tốt nhất để tương tác với cơ sở dữ liệu là gì?

Có hai cách tiếp cận phổ biến để tương tác với cơ sở dữ liệu:

- Sử dụng ngôn ngữ truy vấn gốc của cơ sở dữ liệu, chẳng hạn như SQL.
- Sử dụng Object Relational Mapper ("ORM") hoặc Object Document Mapper ("ODM"). Chúng đại diện dữ liệu của trang web dưới dạng đối tượng JavaScript, sau đó được ánh xạ đến cơ sở dữ liệu cơ bản. Một số ORM và ODM được gắn với một cơ sở dữ liệu cụ thể, trong khi những cái khác cung cấp backend không phụ thuộc cơ sở dữ liệu.

_Hiệu suất_ tốt nhất có thể đạt được bằng cách sử dụng SQL, hoặc bất kỳ ngôn ngữ truy vấn nào được cơ sở dữ liệu hỗ trợ. Các object mapper thường chậm hơn vì chúng sử dụng mã dịch để ánh xạ giữa các đối tượng và định dạng cơ sở dữ liệu, điều này có thể không sử dụng các truy vấn cơ sở dữ liệu hiệu quả nhất (điều này đặc biệt đúng nếu mapper hỗ trợ các backend cơ sở dữ liệu khác nhau và phải thỏa hiệp nhiều hơn về các tính năng cơ sở dữ liệu nào được hỗ trợ).

Lợi ích của việc sử dụng ORM/ODM là lập trình viên có thể tiếp tục suy nghĩ về các đối tượng JavaScript thay vì ngữ nghĩa cơ sở dữ liệu — điều này đặc biệt đúng nếu bạn cần làm việc với các cơ sở dữ liệu khác nhau (trên cùng hoặc các trang web khác nhau). Chúng cũng cung cấp một nơi rõ ràng để thực hiện xác thực dữ liệu.

> [!NOTE]
> Sử dụng ODM/ORM thường dẫn đến chi phí phát triển và bảo trì thấp hơn! Trừ khi bạn rất quen thuộc với ngôn ngữ truy vấn gốc hoặc hiệu suất là quan trọng nhất, bạn nên xem xét mạnh mẽ việc sử dụng ODM.

### Tôi nên sử dụng ORM/ODM nào?

Có nhiều giải pháp ODM/ORM có sẵn trên trang trình quản lý gói npm (xem thẻ [odm](https://www.npmjs.com/search?q=keywords:odm) và [orm](https://www.npmjs.com/search?q=keywords:orm) để xem một phần!).

Một vài giải pháp phổ biến tại thời điểm viết là:

- [Mongoose](https://www.npmjs.com/package/mongoose): Mongoose là công cụ mô hình đối tượng [MongoDB](https://www.mongodb.com/) được thiết kế để làm việc trong môi trường bất đồng bộ.
- [Waterline](https://www.npmjs.com/package/waterline): ORM được trích xuất từ framework web [Sails](https://sailsjs.com/) dựa trên Express. Nó cung cấp API thống nhất để truy cập nhiều cơ sở dữ liệu khác nhau, bao gồm Redis, MySQL, LDAP, MongoDB và Postgres.
- [Bookshelf](https://www.npmjs.com/package/bookshelf): Tích hợp cả giao diện promise-based và hàm gọi lại truyền thống, cung cấp hỗ trợ giao dịch, tải quan hệ eager/nested-eager, các liên kết đa hình và hỗ trợ quan hệ one-to-one, one-to-many và many-to-many. Làm việc với PostgreSQL, MySQL và SQLite3.
- [Objection](https://www.npmjs.com/package/objection): Làm cho việc sử dụng toàn bộ sức mạnh của SQL và công cụ cơ sở dữ liệu cơ bản trở nên dễ dàng nhất có thể (hỗ trợ SQLite3, Postgres và MySQL).
- [Sequelize](https://www.npmjs.com/package/sequelize) là ORM promise-based cho Node.js và io.js. Nó hỗ trợ các phương ngữ PostgreSQL, MySQL, MariaDB, SQLite và MSSQL và có hỗ trợ giao dịch vững chắc, quan hệ, đọc bản sao và nhiều hơn nữa.
- [Node ORM2](https://node-orm.readthedocs.io/en/latest/) là Object Relationship Manager cho NodeJS. Nó hỗ trợ MySQL, SQLite và Postgres, giúp làm việc với cơ sở dữ liệu bằng cách sử dụng phương pháp hướng đối tượng.
- [GraphQL](https://graphql.org/): Chủ yếu là ngôn ngữ truy vấn cho các API restful, GraphQL rất phổ biến và có các tính năng để đọc dữ liệu từ cơ sở dữ liệu.

Theo nguyên tắc chung, bạn nên xem xét cả các tính năng được cung cấp và "hoạt động cộng đồng" (tải xuống, đóng góp, báo cáo lỗi, chất lượng tài liệu, v.v.) khi chọn giải pháp. Tại thời điểm viết, Mongoose là ODM phổ biến nhất và là lựa chọn hợp lý nếu bạn đang sử dụng MongoDB cho cơ sở dữ liệu của mình.

### Sử dụng Mongoose và MongoDB cho LocalLibrary

Cho ví dụ _Thư viện cục bộ_ (và phần còn lại của chủ đề này), chúng tôi sẽ sử dụng [Mongoose ODM](https://www.npmjs.com/package/mongoose) để truy cập dữ liệu thư viện của chúng tôi. Mongoose hoạt động như một front end cho [MongoDB](https://www.mongodb.com/company/what-is-mongodb), cơ sở dữ liệu mã nguồn mở [NoSQL](https://en.wikipedia.org/wiki/NoSQL) sử dụng mô hình dữ liệu hướng tài liệu. Một "collection" của "documents" trong cơ sở dữ liệu MongoDB [tương tự như](https://www.mongodb.com/docs/manual/core/databases-and-collections/) một "table" của "rows" trong cơ sở dữ liệu quan hệ.

Sự kết hợp ODM và cơ sở dữ liệu này cực kỳ phổ biến trong cộng đồng Node, một phần vì hệ thống lưu trữ và truy vấn tài liệu trông rất giống JSON và do đó quen thuộc với các nhà phát triển JavaScript.

> [!NOTE]
> Bạn không cần biết MongoDB để sử dụng Mongoose, mặc dù các phần của [tài liệu Mongoose](https://mongoosejs.com/docs/guide.html) _dễ_ sử dụng và hiểu hơn nếu bạn đã quen với MongoDB.

Phần còn lại của hướng dẫn này chỉ cách định nghĩa và truy cập lược đồ và mô hình Mongoose cho ví dụ [trang web LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website).

## Thiết kế các mô hình LocalLibrary

Trước khi bạn bắt đầu viết mã các mô hình, đáng để dành vài phút để suy nghĩ về dữ liệu chúng tôi cần lưu trữ và mối quan hệ giữa các đối tượng khác nhau.

Chúng tôi biết rằng chúng tôi cần lưu trữ thông tin về sách (tiêu đề, tóm tắt, tác giả, thể loại, ISBN) và rằng chúng tôi có thể có nhiều bản sao có sẵn (với ID duy nhất toàn cầu, trạng thái sẵn có, v.v.). Chúng tôi có thể cần lưu trữ nhiều thông tin hơn về tác giả ngoài tên của họ và có thể có nhiều tác giả có cùng tên hoặc tên tương tự. Chúng tôi muốn có thể sắp xếp thông tin dựa trên tiêu đề sách, tác giả, thể loại và danh mục.

Khi thiết kế các mô hình của bạn, có ý nghĩa khi có các mô hình riêng biệt cho mỗi "đối tượng" (một nhóm thông tin liên quan). Trong trường hợp này, một số ứng viên rõ ràng cho các mô hình này là sách, phiên bản sách và tác giả.

Bạn cũng có thể muốn sử dụng các mô hình để đại diện cho các tùy chọn danh sách lựa chọn (ví dụ: như danh sách thả xuống của các lựa chọn), thay vì mã hóa cứng các lựa chọn vào chính trang web — điều này được khuyến nghị khi tất cả các tùy chọn không biết trước hoặc có thể thay đổi. Một ví dụ điển hình là thể loại (ví dụ: giả tưởng, khoa học viễn tưởng, v.v.).

Một khi chúng tôi đã quyết định về các mô hình và trường của mình, chúng tôi cần suy nghĩ về mối quan hệ giữa chúng.

Với điều đó trong tâm trí, sơ đồ liên kết UML bên dưới cho thấy các mô hình chúng tôi sẽ định nghĩa trong trường hợp này (dưới dạng các hộp). Như đã thảo luận ở trên, chúng tôi đã tạo các mô hình cho sách (chi tiết chung của sách), phiên bản sách (trạng thái của các bản sao vật lý cụ thể của sách có trong hệ thống) và tác giả. Chúng tôi cũng đã quyết định có mô hình cho thể loại để các giá trị có thể được tạo động. Chúng tôi đã quyết định không có mô hình cho `BookInstance:status` — chúng tôi sẽ mã hóa cứng các giá trị chấp nhận được vì chúng tôi không mong đợi chúng thay đổi. Trong mỗi hộp, bạn có thể thấy tên mô hình, tên và kiểu trường và cả các phương thức và kiểu trả về của chúng.

Sơ đồ cũng cho thấy mối quan hệ giữa các mô hình, bao gồm _bội số_ của chúng. Bội số là các con số trên sơ đồ cho thấy số lượng (tối đa và tối thiểu) của mỗi mô hình có thể có trong quan hệ. Ví dụ: đường kết nối giữa các hộp cho thấy `Book` và `Genre` có liên quan. Các con số gần mô hình `Book` cho thấy một `Genre` phải có không hoặc nhiều `Book` (tùy thích), trong khi các con số ở đầu kia của đường gần `Genre` cho thấy một cuốn sách có thể có không hoặc nhiều `Genre` liên quan.

> [!NOTE]
> Như đã thảo luận trong phần [Mongoose primer](#mongoose_primer) bên dưới, thường tốt hơn khi có trường định nghĩa mối quan hệ giữa các tài liệu/mô hình chỉ trong _một_ mô hình (bạn vẫn có thể tìm quan hệ ngược bằng cách tìm kiếm `_id` liên quan trong mô hình khác). Bên dưới chúng tôi đã chọn định nghĩa mối quan hệ giữa `Book`/`Genre` và `Book`/`Author` trong lược đồ Book, và mối quan hệ giữa `Book`/`BookInstance` trong Lược đồ `BookInstance`. Lựa chọn này phần nào tùy ý — chúng tôi có thể đặt trường trong lược đồ khác một cách bình thường.

![Mongoose Library Model with correct cardinality](library_website_-_mongoose_express.png)

> [!NOTE]
> Phần tiếp theo cung cấp phần giới thiệu cơ bản giải thích cách định nghĩa và sử dụng các mô hình. Khi bạn đọc nó, hãy xem xét cách chúng tôi sẽ xây dựng từng mô hình trong sơ đồ trên.

### Các API cơ sở dữ liệu là bất đồng bộ

Các phương thức cơ sở dữ liệu để tạo, tìm, cập nhật hoặc xóa bản ghi là bất đồng bộ.
Điều này có nghĩa là các phương thức trả về ngay lập tức và mã để xử lý thành công hoặc thất bại của phương thức chạy vào thời điểm sau khi hoạt động hoàn thành.
Mã khác có thể thực thi trong khi máy chủ đang chờ thao tác cơ sở dữ liệu hoàn thành, vì vậy máy chủ có thể giữ phản hồi cho các yêu cầu khác.

JavaScript có một số cơ chế để hỗ trợ hành vi bất đồng bộ.
Về mặt lịch sử, JavaScript phụ thuộc nhiều vào việc truyền [hàm gọi lại](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing) đến các phương thức bất đồng bộ để xử lý các trường hợp thành công và lỗi.
Trong JavaScript hiện đại, hàm gọi lại đã phần lớn được thay thế bởi [Promises](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).
Promises là các đối tượng được (ngay lập tức) trả về bởi phương thức bất đồng bộ đại diện cho trạng thái tương lai của nó.
Khi hoạt động hoàn thành, đối tượng promise được "giải quyết" và phân giải một đối tượng đại diện cho kết quả của hoạt động hoặc một lỗi.

Có hai cách chính bạn có thể sử dụng promises để chạy mã khi promise được giải quyết, và chúng tôi khuyến khích mạnh mẽ bạn đọc [Cách sử dụng promises](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises) để có cái nhìn tổng quan cấp cao về cả hai cách tiếp cận.
Trong hướng dẫn này, chúng tôi sẽ chủ yếu sử dụng [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) để chờ hoàn thành promise trong [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), vì điều này dẫn đến mã bất đồng bộ dễ đọc và dễ hiểu hơn.

Cách cách tiếp cận này hoạt động là bạn sử dụng từ khóa `async function` để đánh dấu hàm là bất đồng bộ và sau đó trong hàm đó áp dụng `await` cho bất kỳ phương thức nào trả về promise.
Khi hàm bất đồng bộ được thực thi, hoạt động của nó bị tạm dừng tại phương thức `await` đầu tiên cho đến khi promise giải quyết.
Từ quan điểm của mã xung quanh, hàm bất đồng bộ sau đó trả về và mã sau nó có thể chạy.
Sau này khi promise giải quyết, phương thức `await` trong hàm bất đồng bộ trả về với kết quả, hoặc lỗi được ném ra nếu promise bị từ chối.
Mã trong hàm bất đồng bộ sau đó thực thi cho đến khi gặp `await` khác, tại thời điểm đó nó sẽ tạm dừng lại, hoặc cho đến khi tất cả mã trong hàm đã được chạy.

Bạn có thể thấy cách này hoạt động trong ví dụ bên dưới.
`myFunction()` là hàm bất đồng bộ được gọi trong khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch).
Khi `myFunction()` chạy, thực thi mã bị tạm dừng tại `methodThatReturnsPromise()` cho đến khi promise giải quyết, tại thời điểm đó mã tiếp tục đến `functionThatReturnsPromise()` và chờ lại.
Mã trong khối `catch` chạy nếu lỗi được ném ra trong hàm bất đồng bộ và điều này sẽ xảy ra nếu promise được trả về bởi một trong các phương thức bị từ chối.

```js
async function myFunction() {
  // …
  await someObject.methodThatReturnsPromise();
  // …
  await functionThatReturnsPromise();
  // …
}

try {
  // …
  myFunction();
  // …
} catch (e) {
  // error handling code
}
```

Các phương thức bất đồng bộ ở trên được chạy tuần tự.
Nếu các phương thức không phụ thuộc vào nhau, bạn có thể chạy chúng song song và hoàn thành toàn bộ hoạt động nhanh hơn.
Điều này được thực hiện bằng cách sử dụng phương thức [`Promise.all()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all), nhận một iterable của các promise làm đầu vào và trả về một `Promise` duy nhất.
Promise được trả về này hoàn thành khi tất cả các promise đầu vào hoàn thành, với mảng các giá trị hoàn thành.
Nó từ chối khi bất kỳ promise đầu vào nào từ chối, với lý do từ chối đầu tiên này.

Mã bên dưới chỉ ra cách điều này hoạt động.
Đầu tiên, chúng tôi có hai hàm trả về promises.
Chúng tôi `await` trên cả hai để hoàn thành bằng cách sử dụng promise được trả về bởi `Promise.all()`.
Một khi cả hai hoàn thành, `await` trả về và mảng kết quả được điền,
sau đó hàm tiếp tục đến `await` tiếp theo và chờ cho đến khi promise được trả về bởi `anotherFunctionThatReturnsPromise()` được giải quyết.
Bạn sẽ gọi `myFunction()` trong khối `try...catch` để bắt bất kỳ lỗi nào.

```js
async function myFunction() {
  // …
  const [resultFunction1, resultFunction2] = await Promise.all([
    functionThatReturnsPromise1(),
    functionThatReturnsPromise2(),
  ]);
  // …
  await anotherFunctionThatReturnsPromise(resultFunction1);
}
```

Promises với `await`/`async` cho phép kiểm soát linh hoạt và "dễ hiểu" đối với việc thực thi bất đồng bộ!

## Mongoose primer

Phần này cung cấp tổng quan về cách kết nối Mongoose với cơ sở dữ liệu MongoDB, cách định nghĩa lược đồ và mô hình và cách thực hiện các truy vấn cơ bản.

> [!NOTE]
> Phần giới thiệu này chịu ảnh hưởng nhiều từ [Mongoose quick start](https://www.npmjs.com/package/mongoose) trên _npm_ và [tài liệu chính thức](https://mongoosejs.com/docs/guide.html).

### Cài đặt Mongoose và MongoDB

Mongoose được cài đặt trong dự án của bạn (**package.json**) như bất kỳ phụ thuộc nào khác — sử dụng npm.
Để cài đặt nó, hãy sử dụng lệnh sau trong thư mục dự án của bạn:

```bash
npm install mongoose
```

Cài đặt _Mongoose_ thêm tất cả các phụ thuộc của nó, bao gồm trình điều khiển cơ sở dữ liệu MongoDB, nhưng không cài đặt MongoDB bản thân. Nếu bạn muốn cài đặt máy chủ MongoDB thì bạn có thể [tải xuống trình cài đặt từ đây](https://www.mongodb.com/try/download/community) cho các hệ điều hành khác nhau và cài đặt nó cục bộ. Bạn cũng có thể sử dụng các phiên bản MongoDB dựa trên đám mây.

> [!NOTE]
> Cho hướng dẫn này, chúng tôi sẽ sử dụng cấp miễn phí _database as a service_ dựa trên đám mây [MongoDB Atlas](https://www.mongodb.com/) để cung cấp cơ sở dữ liệu. Điều này phù hợp cho phát triển và có ý nghĩa cho hướng dẫn vì nó làm cho "cài đặt" không phụ thuộc hệ điều hành (database-as-a-service cũng là một cách tiếp cận bạn có thể sử dụng cho cơ sở dữ liệu sản xuất của mình).

### Kết nối với MongoDB

_Mongoose_ yêu cầu kết nối với cơ sở dữ liệu MongoDB.
Bạn có thể `require()` và kết nối với cơ sở dữ liệu được lưu trữ cục bộ bằng `mongoose.connect()` như được hiển thị bên dưới (cho hướng dẫn, chúng tôi sẽ thay vào đó kết nối với cơ sở dữ liệu được lưu trữ trên Internet).

```js
// Import the mongoose module
const mongoose = require("mongoose");

// Define the database URL to connect to.
const mongoDB = "mongodb://127.0.0.1/my_database";

// Wait for database to connect, logging an error if there is a problem
main().catch((err) => console.log(err));
async function main() {
  await mongoose.connect(mongoDB);
}
```

> [!NOTE]
> Như đã thảo luận trong phần [Các API cơ sở dữ liệu là bất đồng bộ](#database_apis_are_asynchronous), ở đây chúng tôi `await` trên promise được trả về bởi phương thức `connect()` trong hàm `async`.
> Chúng tôi sử dụng trình xử lý `catch()` của promise để xử lý bất kỳ lỗi nào khi cố gắng kết nối, nhưng chúng tôi cũng có thể đã gọi `main()` trong khối `try...catch`.

Bạn có thể lấy đối tượng `Connection` mặc định bằng `mongoose.connection`.
Nếu bạn cần tạo các kết nối bổ sung, bạn có thể sử dụng `mongoose.createConnection()`.
Điều này lấy cùng dạng URI cơ sở dữ liệu (với host, cơ sở dữ liệu, cổng, tùy chọn, v.v.) như `connect()` và trả về đối tượng `Connection`).
Lưu ý rằng `createConnection()` trả về ngay lập tức; nếu bạn cần chờ kết nối được thiết lập, bạn có thể gọi nó với `asPromise()` để trả về promise (`mongoose.createConnection(mongoDB).asPromise()`).

### Định nghĩa và tạo mô hình

Các mô hình được _định nghĩa_ bằng giao diện `Schema`. Schema cho phép bạn định nghĩa các trường được lưu trữ trong mỗi tài liệu cùng với các yêu cầu xác thực và giá trị mặc định của chúng. Ngoài ra, bạn có thể định nghĩa các phương thức helper tĩnh và cá thể để làm cho việc làm việc với các kiểu dữ liệu của bạn dễ dàng hơn và cũng các thuộc tính ảo mà bạn có thể sử dụng như bất kỳ trường nào khác, nhưng thực sự không được lưu trữ trong cơ sở dữ liệu (chúng tôi sẽ thảo luận thêm một chút bên dưới).

Sau đó, các lược đồ được "biên dịch" thành các mô hình bằng phương thức `mongoose.model()`. Một khi bạn có mô hình, bạn có thể sử dụng nó để tìm, tạo, cập nhật và xóa các đối tượng của kiểu đã cho.

> [!NOTE]
> Mỗi mô hình ánh xạ đến một _collection_ của _documents_ trong cơ sở dữ liệu MongoDB. Các tài liệu sẽ chứa các trường/kiểu lược đồ được định nghĩa trong `Schema` của mô hình.

#### Định nghĩa lược đồ

Đoạn mã bên dưới chỉ ra cách bạn có thể định nghĩa một lược đồ đơn giản. Đầu tiên bạn `require()` mongoose, sau đó sử dụng constructor Schema để tạo phiên bản lược đồ mới, định nghĩa các trường khác nhau bên trong nó trong tham số đối tượng của constructor.

```js
// Require Mongoose
const mongoose = require("mongoose");

// Define a schema
const Schema = mongoose.Schema;

const SomeModelSchema = new Schema({
  a_string: String,
  a_date: Date,
});
```

Trong trường hợp trên, chúng tôi chỉ có hai trường, một chuỗi và một ngày. Trong các phần tiếp theo, chúng tôi sẽ hiển thị một số kiểu trường khác, xác thực và các phương thức khác.

#### Tạo mô hình

Các mô hình được tạo từ các lược đồ bằng phương thức `mongoose.model()`:

```js
// Define schema
const Schema = mongoose.Schema;

const SomeModelSchema = new Schema({
  a_string: String,
  a_date: Date,
});

// Compile model from schema
const SomeModel = mongoose.model("SomeModel", SomeModelSchema);
```

Đối số đầu tiên là tên số ít của collection sẽ được tạo cho mô hình của bạn (Mongoose sẽ tạo collection cơ sở dữ liệu cho mô hình _SomeModel_ ở trên) và đối số thứ hai là lược đồ bạn muốn sử dụng để tạo mô hình.

> [!NOTE]
> Một khi bạn đã định nghĩa các lớp mô hình của mình, bạn có thể sử dụng chúng để tạo, cập nhật hoặc xóa bản ghi và chạy các truy vấn để lấy tất cả bản ghi hoặc các tập hợp con cụ thể của bản ghi. Chúng tôi sẽ chỉ cho bạn cách thực hiện điều này trong phần [Sử dụng mô hình](#using_models) và khi chúng tôi tạo các views của mình.

#### Kiểu lược đồ (trường)

Một lược đồ có thể có số lượng trường tùy ý — mỗi trường đại diện cho một trường trong các tài liệu được lưu trữ trong _MongoDB_.
Một lược đồ ví dụ hiển thị nhiều loại trường phổ biến và cách chúng được khai báo được hiển thị bên dưới.

```js
const schema = new Schema({
  name: String,
  binary: Buffer,
  living: Boolean,
  updated: { type: Date, default: Date.now() },
  age: { type: Number, min: 18, max: 65, required: true },
  mixed: Schema.Types.Mixed,
  _someId: Schema.Types.ObjectId,
  array: [],
  ofString: [String], // You can also have an array of each of the other types too.
  nested: { stuff: { type: String, lowercase: true, trim: true } },
});
```

Hầu hết các [SchemaTypes](https://mongoosejs.com/docs/schematypes.html) (các mô tả sau "type:" hoặc sau tên trường) tự giải thích. Các ngoại lệ là:

- `ObjectId`: Đại diện cho các phiên bản cụ thể của mô hình trong cơ sở dữ liệu. Ví dụ: một cuốn sách có thể sử dụng điều này để đại diện cho đối tượng tác giả của nó. Điều này thực sự sẽ chứa ID duy nhất (`_id`) cho đối tượng được chỉ định. Chúng tôi có thể sử dụng phương thức `populate()` để kéo thông tin liên quan vào khi cần.
- [`Mixed`](https://mongoosejs.com/docs/schematypes.html#mixed): Kiểu lược đồ tùy ý.
- `[]`: Mảng các mục. Bạn có thể thực hiện các hoạt động mảng JavaScript trên các mô hình này (push, pop, unshift, v.v.). Các ví dụ trên hiển thị một mảng đối tượng không có kiểu được chỉ định và một mảng đối tượng `String`, nhưng bạn có thể có mảng của bất kỳ kiểu đối tượng nào.

Mã cũng hiển thị cả hai cách khai báo trường:

- _Tên_ và _kiểu_ trường như một cặp key-value (tức là như được thực hiện với các trường `name`, `binary` và `living`).
- _Tên_ trường theo sau bởi đối tượng định nghĩa `type` và bất kỳ _tùy chọn_ nào khác cho trường. Các tùy chọn bao gồm những thứ như:
  - Các giá trị mặc định.
  - Các validator tích hợp (ví dụ: giá trị max/min) và các hàm xác thực tùy chỉnh.
  - Liệu trường có bắt buộc hay không
  - Liệu các trường `String` có được tự động đặt thành chữ thường, chữ hoa hoặc được cắt bớt hay không (ví dụ: `{ type: String, lowercase: true, trim: true }`)

Để biết thêm thông tin về các tùy chọn xem [SchemaTypes](https://mongoosejs.com/docs/schematypes.html) (Tài liệu Mongoose).

#### Xác thực

Mongoose cung cấp các validator tích hợp và tùy chỉnh, và các validator đồng bộ và bất đồng bộ. Nó cho phép bạn chỉ định cả phạm vi giá trị chấp nhận được và thông báo lỗi khi xác thực thất bại trong tất cả các trường hợp.

Các validator tích hợp bao gồm:

- Tất cả [SchemaTypes](https://mongoosejs.com/docs/schematypes.html) có validator [required](https://mongoosejs.com/docs/api.html#schematype_SchemaType-required) tích hợp. Điều này được sử dụng để chỉ định liệu trường có phải được cung cấp để lưu tài liệu hay không.
- [Numbers](https://mongoosejs.com/docs/api/schemanumber.html) có validator [min](<https://mongoosejs.com/docs/api/schemanumber.html#SchemaNumber.prototype.min()>) và [max](<https://mongoosejs.com/docs/api/schemanumber.html#SchemaNumber.prototype.max()>).
- [Strings](https://mongoosejs.com/docs/api/schemastring.html) có:
  - [enum](<https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.enum()>): chỉ định tập hợp các giá trị được phép cho trường.
  - [match](<https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.match()>): chỉ định biểu thức chính quy mà chuỗi phải khớp.
  - [maxLength](<https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.maxlength()>) và [minLength](<https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.minlength()>) cho chuỗi.

Ví dụ bên dưới (được sửa đổi một chút từ tài liệu Mongoose) chỉ ra cách bạn có thể chỉ định một số kiểu validator và thông báo lỗi:

```js
const breakfastSchema = new Schema({
  eggs: {
    type: Number,
    min: [6, "Too few eggs"],
    max: 12,
    required: [true, "Why no eggs?"],
  },
  drink: {
    type: String,
    enum: ["Coffee", "Tea", "Water"],
  },
});
```

Để biết thông tin đầy đủ về xác thực trường xem [Validation](https://mongoosejs.com/docs/validation.html) (Tài liệu Mongoose).

#### Thuộc tính ảo

Thuộc tính ảo là các thuộc tính tài liệu bạn có thể lấy và đặt nhưng không được lưu vào MongoDB. Các getter hữu ích để định dạng hoặc kết hợp các trường, trong khi setter hữu ích để phân tách một giá trị đơn lẻ thành nhiều giá trị để lưu trữ. Ví dụ trong tài liệu xây dựng (và phân tách) thuộc tính ảo tên đầy đủ từ trường tên và họ, dễ dàng và sạch hơn so với việc xây dựng tên đầy đủ mỗi khi nó được sử dụng trong mẫu.

> [!NOTE]
> Chúng tôi sẽ sử dụng thuộc tính ảo trong thư viện để định nghĩa URL duy nhất cho mỗi bản ghi mô hình bằng cách sử dụng đường dẫn và giá trị `_id` của bản ghi.

Để biết thêm thông tin xem [Virtuals](https://mongoosejs.com/docs/guide.html#virtuals) (Tài liệu Mongoose).

#### Các phương thức và query helpers

Một lược đồ cũng có thể có [phương thức cá thể](https://mongoosejs.com/docs/guide.html#methods), [phương thức tĩnh](https://mongoosejs.com/docs/guide.html#statics) và [query helpers](https://mongoosejs.com/docs/guide.html#query-helpers). Các phương thức cá thể và tĩnh tương tự nhau, nhưng với sự khác biệt rõ ràng là phương thức cá thể được liên kết với một bản ghi cụ thể và có quyền truy cập vào đối tượng hiện tại. Query helpers cho phép bạn mở rộng [API query builder có thể xâu chuỗi](https://mongoosejs.com/docs/queries.html) của mongoose (ví dụ: cho phép bạn thêm truy vấn "byName" ngoài các phương thức `find()`, `findOne()` và `findById()`).

### Sử dụng mô hình

Một khi bạn đã tạo lược đồ, bạn có thể sử dụng nó để tạo mô hình. Mô hình đại diện cho một collection của tài liệu trong cơ sở dữ liệu mà bạn có thể tìm kiếm, trong khi các cá thể của mô hình đại diện cho các tài liệu riêng lẻ mà bạn có thể lưu và truy xuất.

Chúng tôi cung cấp tổng quan ngắn bên dưới. Để biết thêm thông tin xem: [Models](https://mongoosejs.com/docs/models.html) (Tài liệu Mongoose).

> [!NOTE]
> Tạo, cập nhật, xóa và truy vấn bản ghi là các hoạt động bất đồng bộ trả về [promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).
> Các ví dụ bên dưới chỉ hiển thị việc sử dụng các phương thức liên quan và `await` (tức là mã cần thiết để sử dụng các phương thức).
> Hàm `async` bao quanh và khối `try...catch` để bắt lỗi được bỏ qua để rõ ràng hơn.
> Để biết thêm thông tin về việc sử dụng `await/async` xem [Các API cơ sở dữ liệu là bất đồng bộ](#database_apis_are_asynchronous) ở trên.

#### Tạo và sửa đổi tài liệu

Để tạo bản ghi, bạn có thể định nghĩa một cá thể của mô hình và sau đó gọi [`save()`](https://mongoosejs.com/docs/api/model.html#Model.prototype.save) trên nó.
Các ví dụ bên dưới giả định `SomeModel` là mô hình (có một trường `name`) mà chúng tôi đã tạo từ lược đồ của mình.

```js
// Create an instance of model SomeModel
const awesome_instance = new SomeModel({ name: "awesome" });

// Save the new model instance asynchronously
await awesome_instance.save();
```

Bạn cũng có thể sử dụng [`create()`](https://mongoosejs.com/docs/api/model.html#Model.create) để định nghĩa cá thể mô hình cùng lúc với lưu nó.
Bên dưới chúng tôi chỉ tạo một, nhưng bạn có thể tạo nhiều cá thể bằng cách truyền vào một mảng đối tượng.

```js
await SomeModel.create({ name: "also_awesome" });
```

Mỗi mô hình có một kết nối liên kết (đây sẽ là kết nối mặc định khi bạn sử dụng `mongoose.model()`). Bạn tạo một kết nối mới và gọi `.model()` trên nó để tạo tài liệu trên cơ sở dữ liệu khác.

Bạn có thể truy cập các trường trong bản ghi mới này bằng cú pháp dấu chấm và thay đổi các giá trị. Bạn phải gọi `save()` hoặc `update()` để lưu các giá trị đã sửa đổi trở lại cơ sở dữ liệu.

```js
// Access model field values using dot notation
console.log(awesome_instance.name); // should log 'also_awesome'

// Change record by modifying the fields, then calling save().
awesome_instance.name = "New cool name";
await awesome_instance.save();
```

#### Tìm kiếm bản ghi

Bạn có thể tìm kiếm bản ghi bằng các phương thức truy vấn, chỉ định các điều kiện truy vấn như tài liệu JSON. Đoạn mã bên dưới chỉ ra cách bạn có thể tìm tất cả các vận động viên trong cơ sở dữ liệu chơi tennis, chỉ trả về các trường _name_ và _age_. Ở đây chúng tôi chỉ chỉ định một trường khớp (sport) nhưng bạn có thể thêm nhiều tiêu chí hơn, chỉ định tiêu chí biểu thức chính quy hoặc xóa các điều kiện hoàn toàn để trả về tất cả các vận động viên.

```js
const Athlete = mongoose.model("Athlete", yourSchema);

// find all athletes who play tennis, returning the 'name' and 'age' fields
const tennisPlayers = await Athlete.find(
  { sport: "Tennis" },
  "name age",
).exec();
```

> [!NOTE]
> Điều quan trọng cần nhớ là không tìm thấy kết quả nào **không phải là lỗi** cho tìm kiếm — nhưng có thể là trường hợp thất bại trong ngữ cảnh ứng dụng của bạn.
> Nếu ứng dụng của bạn mong đợi tìm kiếm để tìm giá trị, bạn có thể kiểm tra số mục được trả về trong kết quả.

Các API truy vấn, như [`find()`](<https://mongoosejs.com/docs/api/model.html#Model.find()>), trả về biến kiểu [Query](https://mongoosejs.com/docs/api/query.html).
Bạn có thể sử dụng đối tượng truy vấn để xây dựng truy vấn từng phần trước khi thực thi nó bằng phương thức [`exec()`](https://mongoosejs.com/docs/api/query.html#Query.prototype.exec).
`exec()` thực thi truy vấn và trả về promise mà bạn có thể `await` cho kết quả.

```js
// find all athletes that play tennis
const query = Athlete.find({ sport: "Tennis" });

// selecting the 'name' and 'age' fields
query.select("name age");

// limit our results to 5 items
query.limit(5);

// sort by age
query.sort({ age: -1 });

// execute the query at a later time
query.exec();
```

Ở trên chúng tôi đã định nghĩa các điều kiện truy vấn trong phương thức [`find()`](<https://mongoosejs.com/docs/api/model.html#Model.find()>). Chúng tôi cũng có thể làm điều này bằng hàm [`where()`](<https://mongoosejs.com/docs/api/model.html#Model.where()>) và chúng tôi có thể xâu chuỗi tất cả các phần của truy vấn bằng toán tử dấu chấm (.) thay vì thêm chúng riêng biệt.
Đoạn mã bên dưới giống với truy vấn của chúng tôi ở trên, với điều kiện bổ sung cho age.

```js
Athlete.find()
  .where("sport")
  .equals("Tennis")
  .where("age")
  .gt(17)
  .lt(50) // Additional where query
  .limit(5)
  .sort({ age: -1 })
  .select("name age")
  .exec();
```

Phương thức [`find()`](<https://mongoosejs.com/docs/api/model.html#Model.find()>) lấy tất cả bản ghi khớp, nhưng thường bạn chỉ muốn lấy một kết quả khớp. Các phương thức sau truy vấn cho một bản ghi đơn:

- [`findById()`](<https://mongoosejs.com/docs/api/model.html#Model.findById()>): Tìm tài liệu với `id` được chỉ định (mỗi tài liệu có một `id` duy nhất).
- [`findOne()`](<https://mongoosejs.com/docs/api/model.html#Model.findOne()>): Tìm một tài liệu duy nhất khớp với tiêu chí được chỉ định.
- [`findByIdAndDelete()`](<https://mongoosejs.com/docs/api/model.html#Model.findByIdAndDelete()>), [`findByIdAndUpdate()`](<https://mongoosejs.com/docs/api/model.html#Model.findByIdAndUpdate()>), [`findOneAndRemove()`](<https://mongoosejs.com/docs/api/model.html#Model.findOneAndRemove()>), [`findOneAndUpdate()`](<https://mongoosejs.com/docs/api/model.html#Model.findOneAndUpdate()>): Tìm một tài liệu duy nhất theo `id` hoặc tiêu chí và cập nhật hoặc xóa nó. Đây là các hàm tiện ích hữu ích để cập nhật và xóa bản ghi.

> [!NOTE]
> Cũng có phương thức [`countDocuments()`](<https://mongoosejs.com/docs/api/model.html#Model.countDocuments()>) mà bạn có thể sử dụng để lấy số mục khớp với điều kiện. Điều này hữu ích nếu bạn muốn thực hiện đếm mà không thực sự tải bản ghi.

Có rất nhiều thứ bạn có thể làm với các truy vấn. Để biết thêm thông tin xem: [Queries](https://mongoosejs.com/docs/queries.html) (Tài liệu Mongoose).

#### Làm việc với các tài liệu liên quan — population

Bạn có thể tạo tham chiếu từ một cá thể tài liệu/mô hình đến cái khác bằng cách sử dụng trường lược đồ `ObjectId`, hoặc từ một tài liệu đến nhiều cái bằng cách sử dụng một mảng `ObjectId`. Trường lưu trữ id của mô hình liên quan. Nếu bạn cần nội dung thực tế của tài liệu liên kết, bạn có thể sử dụng phương thức [`populate()`](https://mongoosejs.com/docs/populate.html) trong truy vấn để thay thế id bằng dữ liệu thực tế.

Ví dụ: lược đồ sau định nghĩa tác giả và câu chuyện.
Mỗi tác giả có thể có nhiều câu chuyện, mà chúng tôi đại diện là một mảng `ObjectId`.
Mỗi câu chuyện có thể có một tác giả duy nhất.
Thuộc tính `ref` cho lược đồ biết mô hình nào có thể được gán cho trường này.

```js
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const authorSchema = new Schema({
  name: String,
  stories: [{ type: Schema.Types.ObjectId, ref: "Story" }],
});

const storySchema = new Schema({
  author: { type: Schema.Types.ObjectId, ref: "Author" },
  title: String,
});

const Story = mongoose.model("Story", storySchema);
const Author = mongoose.model("Author", authorSchema);
```

Chúng tôi có thể lưu tham chiếu của chúng tôi đến tài liệu liên quan bằng cách gán giá trị `_id`.
Bên dưới chúng tôi tạo một tác giả, sau đó một câu chuyện và gán id tác giả cho trường tác giả của câu chuyện.

```js
const bob = new Author({ name: "Bob Smith" });

await bob.save();

// Bob now exists, so lets create a story
const story = new Story({
  title: "Bob goes sledding",
  author: bob._id, // assign the _id from our author Bob. This ID is created by default!
});

await story.save();
```

> [!NOTE]
> Một lợi ích tuyệt vời của phong cách lập trình này là chúng tôi không phải phức tạp hóa đường dẫn chính của mã với kiểm tra lỗi.
> Nếu bất kỳ hoạt động `save()` nào thất bại, promise sẽ từ chối và lỗi sẽ được ném ra.
> Mã xử lý lỗi của chúng tôi giải quyết điều đó riêng biệt (thường trong khối `catch()`), vì vậy ý định của mã của chúng tôi rất rõ ràng.

Tài liệu câu chuyện của chúng tôi hiện có tác giả được tham chiếu bởi ID tài liệu tác giả. Để lấy thông tin tác giả trong kết quả câu chuyện, chúng tôi sử dụng [`populate()`](https://mongoosejs.com/docs/api/model.html#Model.populate), như được hiển thị bên dưới.

```js
Story.findOne({ title: "Bob goes sledding" })
  .populate("author") // Replace the author id with actual author information in results
  .exec();
```

> [!NOTE]
> Độc giả tinh tế sẽ nhận thấy rằng chúng tôi đã thêm tác giả vào câu chuyện của mình, nhưng chúng tôi không làm gì để thêm câu chuyện của chúng tôi vào mảng `stories` của tác giả. Làm thế nào để chúng tôi có thể lấy tất cả các câu chuyện của một tác giả cụ thể? Một cách là thêm câu chuyện của chúng tôi vào mảng stories, nhưng điều này sẽ dẫn đến việc chúng tôi có hai nơi mà thông tin liên quan đến tác giả và câu chuyện cần được duy trì.
>
> Cách tốt hơn là lấy `_id` của _tác giả_ và sau đó sử dụng `find()` để tìm kiếm điều này trong trường tác giả qua tất cả các câu chuyện.
>
> ```js
> Story.find({ author: bob._id }).exec();
> ```

Đây là hầu hết tất cả những gì bạn cần biết về làm việc với các mục liên quan _cho hướng dẫn này_. Để biết thêm thông tin chi tiết xem [Population](https://mongoosejs.com/docs/populate.html) (Tài liệu Mongoose).

### Một lược đồ/mô hình mỗi tệp

Mặc dù bạn có thể tạo các lược đồ và mô hình bằng cách sử dụng bất kỳ cấu trúc tệp nào bạn thích, chúng tôi khuyến nghị cao việc định nghĩa mỗi lược đồ mô hình trong module riêng (tệp), sau đó export phương thức để tạo mô hình.
Điều này được hiển thị bên dưới:

```js
// File: ./models/some-model.js

// Require Mongoose
const mongoose = require("mongoose");

// Define a schema
const Schema = mongoose.Schema;

const SomeModelSchema = new Schema({
  a_string: String,
  a_date: Date,
});

// Export function to create "SomeModel" model class
module.exports = mongoose.model("SomeModel", SomeModelSchema);
```

Sau đó bạn có thể yêu cầu và sử dụng mô hình ngay lập tức trong các tệp khác. Bên dưới chúng tôi hiển thị cách bạn có thể sử dụng nó để lấy tất cả các cá thể của mô hình.

```js
// Create a SomeModel model just by requiring the module
const SomeModel = require("../models/some-model");

// Use the SomeModel object (model) to find all SomeModel records
const modelInstances = await SomeModel.find().exec();
```

## Thiết lập cơ sở dữ liệu MongoDB

Bây giờ chúng tôi hiểu điều gì Mongoose có thể làm và cách chúng tôi muốn thiết kế các mô hình của mình, đã đến lúc bắt đầu làm việc trên trang web _LocalLibrary_. Điều đầu tiên chúng tôi muốn làm là thiết lập cơ sở dữ liệu MongoDB mà chúng tôi có thể sử dụng để lưu trữ dữ liệu thư viện.

Cho hướng dẫn này, chúng tôi sẽ sử dụng cơ sở dữ liệu sandbox được lưu trữ trên đám mây [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database). Cấp cơ sở dữ liệu này không được coi là phù hợp cho các trang web sản xuất vì nó không có dự phòng, nhưng nó rất tốt cho phát triển và tạo mẫu. Chúng tôi sử dụng nó ở đây vì nó miễn phí và dễ thiết lập và vì MongoDB Atlas là nhà cung cấp _database as a service_ phổ biến mà bạn có thể chọn hợp lý cho cơ sở dữ liệu sản xuất của mình (các lựa chọn phổ biến khác tại thời điểm viết bao gồm [ScaleGrid](https://scalegrid.io/) và [Rackspace](https://www.rackspace.com/data/rackspace-dbaas)).

> [!NOTE]
> Nếu bạn thích, bạn có thể thiết lập cơ sở dữ liệu MongoDB cục bộ bằng cách tải xuống và cài đặt [các tệp nhị phân phù hợp cho hệ thống của bạn](https://www.mongodb.com/try/download/community-edition/releases). Các hướng dẫn còn lại trong bài viết này sẽ tương tự, ngoại trừ URL cơ sở dữ liệu bạn sẽ chỉ định khi kết nối.
> Trong hướng dẫn [Hướng dẫn Express Phần 7: Triển khai lên môi trường sản xuất](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment), chúng tôi lưu trữ cả ứng dụng và cơ sở dữ liệu trên [Railway](https://railway.com/), nhưng chúng tôi có thể đã sử dụng cơ sở dữ liệu trên [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database).

Trước tiên bạn sẽ cần [tạo tài khoản](https://www.mongodb.com/cloud/atlas/register) với MongoDB Atlas (điều này miễn phí và chỉ yêu cầu bạn nhập thông tin liên hệ cơ bản và xác nhận điều khoản dịch vụ của họ).

Sau khi đăng nhập, bạn sẽ được đưa đến màn hình [home](https://cloud.mongodb.com/v2):

1. Nhấp vào nút **+ Create** trong phần _Overview_.

   ![Create a database on MongoDB Atlas.](mongodb_atlas_-_createdatabase.jpg)

2. Điều này sẽ mở màn hình _Deploy your cluster_.
   Nhấp vào mẫu tùy chọn **M0 FREE**.

   ![Choose a deployment option when using MongoDB Atlas.](mongodb_atlas_-_deploy.jpg)

3. Cuộn xuống trang để xem các tùy chọn khác nhau bạn có thể chọn.
   ![Choose a cloud provider when using MongoDB Atlas.](mongodb_atlas_-_createsharedcluster.jpg)
   - Bạn có thể thay đổi tên Cluster của mình trong _Cluster Name_.
     Chúng tôi giữ nó là `Cluster0` cho hướng dẫn này.
   - Bỏ chọn hộp kiểm _Preload sample dataset_ vì chúng tôi sẽ import dữ liệu mẫu của riêng mình sau này
   - Chọn bất kỳ provider và vùng nào từ các phần _Provider_ và _Region_. Các vùng khác nhau cung cấp các provider khác nhau.
   - Tags là tùy chọn. Chúng tôi sẽ không sử dụng chúng ở đây.
   - Nhấp vào nút **Create deployment** (việc tạo cluster sẽ mất vài phút).

4. Điều này sẽ mở phần _Security Quickstart_.
   ![Set up the Access Rules on the Security Quickstart screen on MongoDB Atlas.](mongodb_atlas_-_securityquickstart.jpg)
   - Nhập username và password để ứng dụng của bạn sử dụng để truy cập cơ sở dữ liệu (ở trên chúng tôi đã tạo đăng nhập mới "cooluser").
     Hãy nhớ sao chép và lưu trữ thông tin xác thực một cách an toàn vì chúng tôi sẽ cần chúng sau này.
     Nhấp vào nút **Create User**.

     > [!NOTE]
     > Tránh sử dụng các ký tự đặc biệt trong mật khẩu người dùng MongoDB của bạn vì mongoose có thể không phân tích chuỗi kết nối đúng cách.

   - Chọn **Add by current IP address** để cho phép truy cập từ máy tính hiện tại của bạn
   - Nhập `0.0.0.0/0` vào trường IP Address và nhấp vào nút **Add Entry**.
     Điều này cho MongoDB biết rằng chúng tôi muốn cho phép truy cập từ bất kỳ đâu.

     > [!NOTE]
     > Thực hành tốt nhất là giới hạn các địa chỉ IP có thể kết nối với cơ sở dữ liệu và các tài nguyên khác của bạn. Ở đây chúng tôi cho phép kết nối từ bất kỳ đâu vì chúng tôi không biết yêu cầu sẽ đến từ đâu sau khi triển khai.

   - Nhấp vào nút **Finish and Close**.

5. Điều này sẽ mở màn hình sau. Nhấp vào nút **Go to Overview**.
   ![Go to Databases after setting up Access Rules on MongoDB Atlas](mongodb_atlas_-_accessrules.jpg)

6. Bạn sẽ quay lại màn hình _Overview_. Nhấp vào phần _Database_ trong menu _Deployment_ ở bên trái. Nhấp vào nút **Browse Collections**.
   ![Setup a collection on MongoDB Atlas.](mongodb_atlas_-_createcollection.jpg)

7. Điều này sẽ mở phần _Collections_. Nhấp vào nút **Add My Own Data**.
   ![Create a database on MongoDB Atlas.](mongodb_atlas_-_adddata.jpg)

8. Điều này sẽ mở màn hình _Create Database_.

   ![Details during database creation on MongoDB Atlas.](mongodb_atlas_-_databasedetails.jpg)
   - Nhập tên cho cơ sở dữ liệu mới là `local_library`.
   - Nhập tên của collection là `Collection0`.
   - Nhấp vào nút **Create** để tạo cơ sở dữ liệu.

9. Bạn sẽ quay lại màn hình _Collections_ với cơ sở dữ liệu đã tạo của bạn.
   ![Database creation confirmation on MongoDB Atlas.](mongodb_atlas_-_databasecreated.jpg)
   - Nhấp vào tab _Overview_ để quay lại tổng quan cluster.

10. Từ màn hình _Overview_ của Cluster0 nhấp vào nút **Connect**.

    ![Configure connection after setting up a cluster in MongoDB Atlas.](mongodb_atlas_-_connectbutton.jpg)

11. Điều này sẽ mở màn hình _Connect to Cluster0_.

    ![Choose the Short SRV connection when setting up a connection on MongoDB Atlas.](mongodb_atlas_-_connectforshortsrv.jpg)
    - Chọn người dùng cơ sở dữ liệu của bạn.
    - Chọn danh mục _Drivers_, sau đó _Driver_ **Node.js** và _Version_ như được hiển thị.
    - **KHÔNG** cài đặt driver như được đề xuất.
    - Nhấp vào biểu tượng **Copy** để sao chép chuỗi kết nối.
    - Dán điều này vào trình soạn thảo văn bản cục bộ của bạn.
    - Thay thế trình giữ chỗ `<password>` trong chuỗi kết nối bằng mật khẩu người dùng của bạn.
    - Chèn tên cơ sở dữ liệu "local_library" vào đường dẫn trước các tùy chọn (`...mongodb.net/local_library?retryWrites...`)
    - Lưu tệp chứa chuỗi này ở nơi an toàn.

Bây giờ bạn đã tạo cơ sở dữ liệu và có URL (với username và password) có thể được sử dụng để truy cập nó.
Điều này sẽ trông giống như: `mongodb+srv://your_user_name:your_password@cluster0.cojoign.mongodb.net/local_library?retryWrites=true&w=majority&appName=Cluster0`

## Cài đặt Mongoose

Mở command prompt và điều hướng đến thư mục nơi bạn đã tạo [trang web Thư viện cục bộ khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website).
Nhập lệnh sau để cài đặt Mongoose (và các phụ thuộc của nó) và thêm nó vào tệp **package.json** của bạn, trừ khi bạn đã làm vậy khi đọc [Mongoose Primer](#installing_mongoose_and_mongodb) ở trên.

```bash
npm install mongoose
```

## Kết nối với MongoDB

Mở **bin/www** (từ thư mục gốc dự án của bạn) và sao chép văn bản sau bên dưới nơi bạn đặt cổng (sau dòng `app.set("port", port);`).
Thay thế chuỗi URL cơ sở dữ liệu ('_insert_your_database_url_here_') bằng URL vị trí đại diện cho cơ sở dữ liệu của bạn (tức là sử dụng thông tin từ _MongoDB Atlas_).

```js
// Set up mongoose connection
const mongoose = require("mongoose");

const mongoDB = "insert_your_database_url_here";

async function connectMongoose() {
  await mongoose.connect(mongoDB);

  // Add connection error handlers
  mongoose.connection.on("error", (err) => {
    console.error("MongoDB connection error:", err);
  });

  mongoose.connection.on("disconnected", () => {
    console.warn("MongoDB disconnected");
  });
}

try {
  connectMongoose();
} catch (err) {
  console.error("Failed to connect to MongoDB:", err);
  process.exit(1);
}
```

Như đã thảo luận trong phần [Mongoose primer](#connecting_to_mongodb) ở trên, mã này tạo kết nối mặc định đến cơ sở dữ liệu và báo cáo bất kỳ lỗi nào vào console.

> [!NOTE]
> Chúng tôi có thể đặt mã kết nối cơ sở dữ liệu vào mã **app.js** của chúng tôi.
> Đặt nó ở điểm vào ứng dụng tách rời ứng dụng và cơ sở dữ liệu, làm cho việc sử dụng cơ sở dữ liệu khác để chạy mã kiểm thử dễ dàng hơn.

Lưu ý rằng mã hóa cứng thông tin xác thực cơ sở dữ liệu trong mã nguồn như được hiển thị ở trên không được khuyến nghị.
Chúng tôi làm điều đó ở đây vì nó hiển thị mã kết nối cốt lõi và vì trong quá trình phát triển không có rủi ro đáng kể rằng việc rò rỉ các chi tiết này sẽ tiết lộ hoặc làm hỏng thông tin nhạy cảm.
Chúng tôi sẽ chỉ cho bạn cách thực hiện điều này an toàn hơn khi [triển khai lên môi trường sản xuất](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment#database_configuration)!

## Định nghĩa Lược đồ LocalLibrary

Chúng tôi sẽ định nghĩa một module riêng cho mỗi mô hình, như [đã thảo luận ở trên](#one_schemamodel_per_file).
Bắt đầu bằng cách tạo thư mục cho các mô hình của chúng tôi trong thư mục gốc dự án (**/models**) và sau đó tạo các tệp riêng biệt cho mỗi mô hình:

```plain
/express-locallibrary-tutorial  # the project root
  /models
    author.js
    book.js
    bookinstance.js
    genre.js
```

### Mô hình Author

Sao chép mã lược đồ `Author` được hiển thị bên dưới và dán nó vào tệp **./models/author.js** của bạn.
Lược đồ định nghĩa tác giả là có `String` SchemaTypes cho tên và họ (bắt buộc, tối đa 100 ký tự) và các trường `Date` cho ngày sinh và ngày mất.

```js
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const AuthorSchema = new Schema({
  first_name: { type: String, required: true, maxLength: 100 },
  family_name: { type: String, required: true, maxLength: 100 },
  date_of_birth: { type: Date },
  date_of_death: { type: Date },
});

// Virtual for author's full name
AuthorSchema.virtual("name").get(function () {
  // To avoid errors in cases where an author does not have either a family name or first name
  // We want to make sure we handle the exception by returning an empty string for that case
  let fullname = "";
  if (this.first_name && this.family_name) {
    fullname = `${this.family_name}, ${this.first_name}`;
  }

  return fullname;
});

// Virtual for author's URL
AuthorSchema.virtual("url").get(function () {
  // We don't use an arrow function as we'll need the this object
  return `/catalog/author/${this._id}`;
});

// Export model
module.exports = mongoose.model("Author", AuthorSchema);
```

Chúng tôi cũng đã khai báo [virtual](#virtual_properties) cho AuthorSchema có tên "url" trả về URL tuyệt đối cần thiết để lấy một cá thể cụ thể của mô hình — chúng tôi sẽ sử dụng thuộc tính trong các mẫu bất cứ khi nào chúng tôi cần lấy liên kết đến một tác giả cụ thể.

> [!NOTE]
> Khai báo các URL của chúng tôi là virtual trong lược đồ là ý tưởng hay vì URL của một mục chỉ cần được thay đổi ở một nơi.
> Tại thời điểm này, liên kết sử dụng URL này sẽ không hoạt động vì chúng tôi chưa có mã xử lý route cho các cá thể mô hình riêng lẻ.
> Chúng tôi sẽ thiết lập những thứ đó trong một bài viết sau!

Ở cuối module, chúng tôi export mô hình.

### Mô hình Book

Sao chép mã lược đồ `Book` được hiển thị bên dưới và dán nó vào tệp **./models/book.js** của bạn.
Hầu hết trong số này tương tự với mô hình tác giả — chúng tôi đã khai báo một lược đồ với một số trường chuỗi và virtual để lấy URL của các bản ghi sách cụ thể và chúng tôi đã export mô hình.

```js
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const BookSchema = new Schema({
  title: { type: String, required: true },
  author: { type: Schema.Types.ObjectId, ref: "Author", required: true },
  summary: { type: String, required: true },
  isbn: { type: String, required: true },
  genre: [{ type: Schema.Types.ObjectId, ref: "Genre" }],
});

// Virtual for book's URL
BookSchema.virtual("url").get(function () {
  // We don't use an arrow function as we'll need the this object
  return `/catalog/book/${this._id}`;
});

// Export model
module.exports = mongoose.model("Book", BookSchema);
```

Sự khác biệt chính ở đây là chúng tôi đã tạo hai tham chiếu đến các mô hình khác:

- author là tham chiếu đến một đối tượng mô hình `Author` duy nhất và là bắt buộc.
- genre là tham chiếu đến một mảng các đối tượng mô hình `Genre`. Chúng tôi chưa khai báo đối tượng này!

### Mô hình BookInstance

Cuối cùng, sao chép mã lược đồ `BookInstance` được hiển thị bên dưới và dán nó vào tệp **./models/bookinstance.js** của bạn.
`BookInstance` đại diện cho một bản sao cụ thể của một cuốn sách mà ai đó có thể mượn và bao gồm thông tin về liệu bản sao có sẵn hay không, vào ngày nào dự kiến nó sẽ được trả lại và chi tiết "imprint" (hoặc phiên bản).

```js
const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const BookInstanceSchema = new Schema({
  book: { type: Schema.Types.ObjectId, ref: "Book", required: true }, // reference to the associated book
  imprint: { type: String, required: true },
  status: {
    type: String,
    required: true,
    enum: ["Available", "Maintenance", "Loaned", "Reserved"],
    default: "Maintenance",
  },
  due_back: { type: Date, default: Date.now },
});

// Virtual for bookinstance's URL
BookInstanceSchema.virtual("url").get(function () {
  // We don't use an arrow function as we'll need the this object
  return `/catalog/bookinstance/${this._id}`;
});

// Export model
module.exports = mongoose.model("BookInstance", BookInstanceSchema);
```

Những điều mới mà chúng tôi hiển thị ở đây là các tùy chọn trường:

- `enum`: Điều này cho phép chúng tôi đặt các giá trị được phép của chuỗi. Trong trường hợp này, chúng tôi sử dụng nó để chỉ định trạng thái sẵn có của sách của chúng tôi (sử dụng enum có nghĩa là chúng tôi có thể ngăn chặn lỗi chính tả và các giá trị tùy ý cho trạng thái của chúng tôi).
- `default`: Chúng tôi sử dụng default để đặt trạng thái mặc định cho các phiên bản sách mới được tạo là "Maintenance" và ngày `due_back` mặc định là `now` (lưu ý cách bạn có thể gọi hàm Date khi đặt ngày!).

Mọi thứ khác nên quen thuộc từ lược đồ trước đó của chúng tôi.

### Mô hình Genre - thử thách

Mở tệp **./models/genre.js** của bạn và tạo lược đồ để lưu trữ các thể loại (danh mục sách, ví dụ: liệu đó là tiểu thuyết hay phi hư cấu, lãng mạn hay lịch sử quân sự, v.v.).

Định nghĩa sẽ rất tương tự với các mô hình khác:

- Mô hình nên có `String` SchemaType được gọi là `name` để mô tả thể loại.
- Tên này nên bắt buộc và có từ 3 đến 100 ký tự.
- Khai báo [virtual](#virtual_properties) cho URL của thể loại, có tên `url`.
- Export mô hình.

## Kiểm thử — tạo một số mục

Đó là tất cả. Bây giờ chúng tôi đã thiết lập tất cả các mô hình cho trang web!

Để kiểm thử các mô hình (và để tạo một số sách ví dụ và các mục khác mà chúng tôi có thể sử dụng trong các bài viết tiếp theo), chúng tôi sẽ chạy một script _độc lập_ để tạo các mục của mỗi loại:

1. Tải xuống (hoặc tạo) tệp [populatedb.js](https://raw.githubusercontent.com/mdn/express-locallibrary-tutorial/main/populatedb.js) bên trong thư mục _express-locallibrary-tutorial_ của bạn (cùng cấp với `package.json`).

   > [!NOTE]
   > Mã trong `populatedb.js` có thể hữu ích trong việc học JavaScript, nhưng việc hiểu nó không cần thiết cho hướng dẫn này.

2. Chạy script bằng node trong command prompt của bạn, truyền vào URL của cơ sở dữ liệu _MongoDB_ của bạn (cùng cái bạn đã thay thế trình giữ chỗ _insert_your_database_url_here_ bằng, bên trong `app.js` trước đó):

   ```bash
   node populatedb <your MongoDB url>
   ```

   > [!NOTE]
   > Trên Windows bạn cần bọc URL cơ sở dữ liệu bên trong dấu nháy kép (").
   > Trên các hệ điều hành khác bạn có thể cần dấu nháy đơn (').

3. Script nên chạy đến hoàn thành, hiển thị các mục khi nó tạo chúng trong terminal.

> [!NOTE]
> Truy cập cơ sở dữ liệu của bạn trên MongoDB Atlas (trong tab _Collections_).
> Bây giờ bạn có thể đi sâu vào các collection riêng lẻ của Books, Authors, Genres và BookInstances và kiểm tra các tài liệu riêng lẻ.

## Tóm tắt

Trong bài viết này, chúng tôi đã tìm hiểu một chút về cơ sở dữ liệu và ORM trên Node/Express và nhiều hơn về cách lược đồ và mô hình Mongoose được định nghĩa. Sau đó chúng tôi đã sử dụng thông tin này để thiết kế và triển khai các mô hình `Book`, `BookInstance`, `Author` và `Genre` cho trang web _LocalLibrary_.

Cuối cùng, chúng tôi đã kiểm thử các mô hình của mình bằng cách tạo một số cá thể (bằng cách sử dụng script độc lập). Trong bài viết tiếp theo, chúng tôi sẽ xem xét tạo một số trang để hiển thị các đối tượng này.

## Xem thêm

- [Tích hợp cơ sở dữ liệu](https://expressjs.com/en/guide/database-integration.html) (Tài liệu Express)
- [Trang web Mongoose](https://mongoosejs.com/) (Tài liệu Mongoose)
- [Hướng dẫn Mongoose](https://mongoosejs.com/docs/guide.html) (Tài liệu Mongoose)
- [Validation](https://mongoosejs.com/docs/validation.html) (Tài liệu Mongoose)
- [Schema Types](https://mongoosejs.com/docs/schematypes.html) (Tài liệu Mongoose)
- [Models](https://mongoosejs.com/docs/models.html) (Tài liệu Mongoose)
- [Queries](https://mongoosejs.com/docs/queries.html) (Tài liệu Mongoose)
- [Population](https://mongoosejs.com/docs/populate.html) (Tài liệu Mongoose)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website", "Learn_web_development/Extensions/Server-side/Express_Nodejs/routes", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
