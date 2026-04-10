---
title: Dùng IndexedDB
slug: Web/API/IndexedDB_API/Using_IndexedDB
page-type: guide
---

{{DefaultAPISidebar("IndexedDB")}}

IndexedDB là một cách để bạn lưu dữ liệu lâu dài bên trong trình duyệt của người dùng. Vì nó cho phép bạn tạo các ứng dụng web có khả năng truy vấn phong phú bất kể có kết nối mạng hay không, ứng dụng của bạn có thể hoạt động cả trực tuyến lẫn ngoại tuyến.

## Về tài liệu này

Hướng dẫn này sẽ đưa bạn qua cách sử dụng API bất đồng bộ của IndexedDB. Nếu bạn chưa quen với IndexedDB, trước tiên hãy đọc bài [Đặc tính key và thuật ngữ cơ bản của IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology).

Để xem tài liệu tham chiếu về API IndexedDB, hãy xem bài [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) và các trang con của nó. Bài viết này mô tả các kiểu đối tượng mà IndexedDB sử dụng, cũng như các phương thức của API bất đồng bộ (API đồng bộ đã bị loại bỏ khỏi đặc tả).

## Mẫu cơ bản

Mẫu cơ bản mà IndexedDB khuyến khích là:

1. Mở một cơ sở dữ liệu.
2. Tạo một object store trong cơ sở dữ liệu.
3. Bắt đầu một transaction và tạo một request để thực hiện một thao tác cơ sở dữ liệu nào đó, như thêm hoặc truy xuất dữ liệu.
4. Chờ thao tác hoàn tất bằng cách lắng nghe đúng loại sự kiện DOM.
5. Làm gì đó với kết quả, được tìm thấy trên đối tượng request.

Với những khái niệm lớn này trong tay, giờ chúng ta có thể đi đến phần cụ thể hơn.

## Tạo và cấu trúc store

### Mở một cơ sở dữ liệu

Chúng ta bắt đầu toàn bộ quá trình như sau:

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const request = window.indexedDB.open("MyTestDatabase", 3);
```

Thấy chưa? Mở một cơ sở dữ liệu cũng giống như bất kỳ thao tác nào khác - bạn phải "yêu cầu" nó.

Yêu cầu mở không mở cơ sở dữ liệu hay bắt đầu transaction ngay lập tức. Lời gọi hàm `open()` trả về một đối tượng [`IDBOpenDBRequest`](/en-US/docs/Web/API/IDBOpenDBRequest) với giá trị kết quả (thành công) hoặc lỗi mà bạn xử lý như một sự kiện. Hầu hết các hàm bất đồng bộ khác trong IndexedDB cũng làm như vậy - trả về một đối tượng [`IDBRequest`](/en-US/docs/Web/API/IDBRequest) với kết quả hoặc lỗi. Kết quả của hàm mở là một thể hiện của `IDBDatabase`.

Tham số thứ hai của phương thức mở là version của cơ sở dữ liệu. Version của cơ sở dữ liệu quyết định lược đồ cơ sở dữ liệu - các object store trong cơ sở dữ liệu và cấu trúc của chúng. Nếu cơ sở dữ liệu chưa tồn tại, nó sẽ được tạo bởi thao tác `open`, sau đó sự kiện `onupgradeneeded` được kích hoạt và bạn tạo lược đồ cơ sở dữ liệu trong trình xử lý của sự kiện này. Nếu cơ sở dữ liệu đã tồn tại nhưng bạn chỉ định một số version lớn hơn, sự kiện `onupgradeneeded` sẽ được kích hoạt ngay lập tức, cho phép bạn cung cấp lược đồ cập nhật trong trình xử lý của nó. Sẽ nói kỹ hơn ở phần [Tạo hoặc cập nhật version của cơ sở dữ liệu](#creating_or_updating_the_version_of_the_database) bên dưới, và trang tham chiếu {{ domxref("IDBFactory.open") }}.

> [!WARNING]
> Số version là số nguyên, nên các giá trị truyền vào sẽ bị làm tròn. Ví dụ, các giá trị `2.1` và `2.4` đều bị làm tròn thành `2`.
> Việc nâng cấp giữa các số khi làm tròn vẫn cho cùng một số nguyên sẽ không kích hoạt sự kiện `onupgradeneeded`.
> Khi làm việc với các số version lớn, hãy lưu ý thêm về [phạm vi số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding) có thể biểu diễn trong JavaScript.

#### Tạo các trình xử lý

Điều đầu tiên bạn nên làm với hầu hết mọi request bạn tạo ra là thêm trình xử lý thành công và lỗi:

```js
request.onerror = (event) => {
  // Làm gì đó với request.error!
};
request.onsuccess = (event) => {
  // Làm gì đó với request.result!
};
```

Nếu request thành công, sự kiện {{domxref("IDBRequest.success_event", "success")}} sẽ được phát, và hàm gán cho `onsuccess` sẽ được gọi. Nếu request thất bại, sự kiện {{domxref("IDBRequest.error_event", "error")}} sẽ được phát, và hàm gán cho `onerror` sẽ được gọi.

API IndexedDB được thiết kế để giảm thiểu nhu cầu xử lý lỗi, nên bạn có lẽ sẽ không thấy nhiều sự kiện lỗi (ít nhất là sau khi đã quen với API!). Tuy nhiên, trong trường hợp mở cơ sở dữ liệu, vẫn có một số điều kiện thường gặp tạo ra sự kiện lỗi. Vấn đề dễ gặp nhất là người dùng quyết định không cấp cho ứng dụng web của bạn quyền tạo cơ sở dữ liệu. Một trong những mục tiêu thiết kế chính của IndexedDB là cho phép lưu lượng lớn dữ liệu để dùng ngoại tuyến. (Để tìm hiểu thêm về lượng dữ liệu bạn có thể lưu trong mỗi trình duyệt, xem [How much data can be stored? trên trang Browser storage quotas and eviction criteria](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria#how_much_data_can_be_stored).)

Rõ ràng là trình duyệt không muốn cho một mạng quảng cáo hay website độc hại nào đó làm bẩn máy tính của bạn, nên trước đây trình duyệt sẽ hỏi người dùng lần đầu tiên một ứng dụng web cố mở IndexedDB để lưu trữ. Người dùng có thể chọn cho phép hoặc từ chối truy cập. Ngoài ra, lưu trữ IndexedDB trong các chế độ riêng tư của trình duyệt chỉ tồn tại trong bộ nhớ cho đến khi phiên ẩn danh được đóng.

Bây giờ, giả sử người dùng đã cho phép yêu cầu tạo cơ sở dữ liệu của bạn, và bạn đã nhận được sự kiện thành công để kích hoạt callback thành công; tiếp theo là gì? Yêu cầu ở đây được tạo bằng lời gọi `indexedDB.open()`, nên `request.result` là một thể hiện của `IDBDatabase`, và bạn chắc chắn muốn lưu nó lại để dùng sau. Mã của bạn có thể trông như sau:

```js
let db;
const request = indexedDB.open("MyTestDatabase");
request.onerror = (event) => {
  console.error("Why didn't you allow my web app to use IndexedDB?!");
};
request.onsuccess = (event) => {
  db = event.target.result;
};
```

#### Xử lý lỗi

Như đã nói ở trên, sự kiện lỗi sẽ lan lên cha. Sự kiện lỗi được nhắm tới request đã tạo ra lỗi, sau đó sự kiện lan tới transaction, và cuối cùng là đối tượng database. Nếu bạn muốn tránh phải thêm trình xử lý lỗi cho từng request, bạn có thể chỉ cần thêm một trình xử lý lỗi duy nhất trên đối tượng database, như sau:

```js
db.onerror = (event) => {
  // Trình xử lý lỗi chung cho mọi lỗi được nhắm tới các request của database này!
  console.error(`Database error: ${event.target.error?.message}`);
};
```

Một trong những lỗi thường gặp khi mở cơ sở dữ liệu là `VER_ERR`. Nó cho biết version của cơ sở dữ liệu được lưu trên đĩa _lớn hơn_ version mà bạn đang cố mở. Đây là một trường hợp lỗi luôn phải được xử lý bởi trình xử lý lỗi.

### Tạo hoặc cập nhật version của cơ sở dữ liệu

Khi bạn tạo một cơ sở dữ liệu mới hoặc tăng số version của cơ sở dữ liệu hiện có (bằng cách chỉ định version cao hơn trước đây, khi [mở cơ sở dữ liệu](#opening_a_database)), sự kiện `onupgradeneeded` sẽ được kích hoạt và một đối tượng [IDBVersionChangeEvent](/en-US/docs/Web/API/IDBVersionChangeEvent) sẽ được truyền tới mọi trình xử lý sự kiện `onversionchange` được thiết lập trên `request.result` (tức `db` trong ví dụ). Trong trình xử lý của sự kiện `upgradeneeded`, bạn nên tạo các object store cần cho version này của cơ sở dữ liệu:

```js
// Sự kiện này chỉ được triển khai trong các trình duyệt gần đây
request.onupgradeneeded = (event) => {
  // Lưu giao diện IDBDatabase
  const db = event.target.result;

  // Tạo một objectStore cho cơ sở dữ liệu này
  const objectStore = db.createObjectStore("name", { keyPath: "myKey" });
};
```

Trong trường hợp này, cơ sở dữ liệu đã có các object store từ version trước, nên bạn không cần tạo lại chúng. Bạn chỉ cần tạo các object store mới, hoặc xóa các object store của version trước không còn cần nữa. Nếu bạn cần thay đổi một object store hiện có, ví dụ để đổi `keyPath`, thì bạn phải xóa object store cũ và tạo lại nó với tùy chọn mới. (Lưu ý rằng điều này sẽ xóa thông tin trong object store! Nếu bạn cần giữ thông tin đó, hãy đọc nó ra và lưu ở nơi khác trước khi nâng cấp cơ sở dữ liệu.)

Thử tạo một object store với tên đã tồn tại (hoặc cố xóa một object store với tên chưa tồn tại) sẽ ném ra lỗi.

Nếu sự kiện `onupgradeneeded` kết thúc thành công, trình xử lý `onsuccess` của yêu cầu mở cơ sở dữ liệu sau đó sẽ được kích hoạt.

### Cấu trúc cơ sở dữ liệu

Bây giờ đến phần cấu trúc cơ sở dữ liệu. IndexedDB dùng object store thay vì bảng, và một cơ sở dữ liệu đơn có thể chứa bao nhiêu object store tùy ý. Bất cứ khi nào một giá trị được lưu trong object store, nó được gắn với một key. Có nhiều cách khác nhau để cung cấp key, tùy thuộc object store dùng [key path](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) hay [key generator](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_generator).

Bảng sau cho thấy các cách key được cung cấp:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Key Path (<code>keyPath</code>)</th>
      <th scope="col">Key Generator (<code>autoIncrement</code>)</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Không</td>
      <td>Không</td>
      <td>
        Object store này có thể chứa bất kỳ kiểu giá trị nào, kể cả các giá trị
        nguyên thủy như số và chuỗi. Bạn phải cung cấp một đối số key riêng mỗi
        khi muốn thêm một giá trị mới.
      </td>
    </tr>
    <tr>
      <td>Có</td>
      <td>Không</td>
      <td>
        Object store này chỉ có thể chứa các đối tượng JavaScript. Các đối tượng
        phải có một thuộc tính cùng tên với key path.
      </td>
    </tr>
    <tr>
      <td>Không</td>
      <td>Có</td>
      <td>
        Object store này có thể chứa bất kỳ kiểu giá trị nào. Key sẽ được tạo
        tự động cho bạn, hoặc bạn có thể cung cấp một đối số key riêng nếu muốn
        dùng một key cụ thể.
      </td>
    </tr>
    <tr>
      <td>Có</td>
      <td>Có</td>
      <td>
        Object store này chỉ có thể chứa các đối tượng JavaScript. Thông thường
        một key được tạo ra và giá trị key được tạo sẽ được lưu trong object ở
        một thuộc tính cùng tên với key path. Tuy nhiên, nếu thuộc tính đó đã tồn
        tại, giá trị của thuộc tính đó sẽ được dùng làm key thay vì tạo key mới.
      </td>
    </tr>
  </tbody>
</table>

Bạn cũng có thể tạo index trên bất kỳ object store nào, miễn là object store đó chứa object chứ không phải giá trị nguyên thủy. Index cho phép bạn tra cứu các giá trị được lưu trong object store bằng giá trị của một thuộc tính của object đã lưu, thay vì bằng key của object.

Ngoài ra, index còn có thể thực thi các ràng buộc đơn giản trên dữ liệu đã lưu. Bằng cách đặt cờ unique khi tạo index, index sẽ đảm bảo rằng không có hai object nào được lưu mà có cùng giá trị cho key path của index. Ví dụ, nếu bạn có một object store chứa tập hợp người dùng và muốn đảm bảo không có hai người nào có cùng địa chỉ email, bạn có thể dùng một index với cờ unique để thực thi điều đó.

Điều đó có vẻ hơi rối, nhưng ví dụ đơn giản sau sẽ làm sáng tỏ các khái niệm. Trước hết, chúng ta sẽ định nghĩa một số dữ liệu khách hàng để dùng trong ví dụ:

```js
// Đây là dữ liệu khách hàng của chúng ta.
const customerData = [
  { ssn: "444-44-4444", name: "Bill", age: 35, email: "bill@company.com" },
  { ssn: "555-55-5555", name: "Donna", age: 32, email: "donna@home.org" },
];
```

Tất nhiên, bạn sẽ không dùng số an sinh xã hội của ai đó làm primary key cho một bảng khách hàng vì không phải ai cũng có số an sinh xã hội, và bạn sẽ lưu ngày sinh thay vì tuổi, nhưng chúng ta hãy bỏ qua những lựa chọn không mấy hay ho đó để tiện theo dõi.

Bây giờ hãy xem cách tạo một IndexedDB để lưu dữ liệu của chúng ta:

```js
const dbName = "the_name";

const request = indexedDB.open(dbName, 2);

request.onerror = (event) => {
  // Xử lý lỗi.
};
request.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Tạo một objectStore để lưu thông tin về khách hàng.
  // Chúng ta sẽ dùng "ssn" làm key path vì nó được đảm bảo là duy nhất -
  // hoặc ít nhất đó là điều tôi được nói trong buổi họp khởi động.
  const objectStore = db.createObjectStore("customers", { keyPath: "ssn" });

  // Tạo một index để tìm khách hàng theo tên. Chúng ta có thể có trùng lặp
  // nên không thể dùng unique index.
  objectStore.createIndex("name", "name", { unique: false });

  // Tạo một index để tìm khách hàng theo email. Chúng ta muốn đảm bảo rằng
  // không có hai khách hàng nào có cùng email, nên dùng unique index.
  objectStore.createIndex("email", "email", { unique: true });

  // Dùng transaction.oncomplete để bảo đảm việc tạo objectStore đã hoàn tất
  // trước khi thêm dữ liệu vào đó.
  objectStore.transaction.oncomplete = (event) => {
    // Lưu giá trị vào objectStore vừa được tạo.
    const customerObjectStore = db
      .transaction("customers", "readwrite")
      .objectStore("customers");
    customerData.forEach((customer) => {
      customerObjectStore.add(customer);
    });
  };
};
```

Như đã chỉ ra trước đó, `onupgradeneeded` là nơi duy nhất bạn có thể thay đổi cấu trúc cơ sở dữ liệu. Trong đó, bạn có thể tạo và xóa object store, cũng như xây dựng và gỡ bỏ index.

Object store được tạo bằng một lời gọi `createObjectStore()` duy nhất. Phương thức này nhận tên của store và một object tham số. Mặc dù object tham số là tùy chọn, nó rất quan trọng, vì nó cho phép bạn định nghĩa các thuộc tính tùy chọn quan trọng và tinh chỉnh kiểu object store bạn muốn tạo. Trong trường hợp của chúng ta, chúng ta đã yêu cầu một object store tên "customers" và xác định một `keyPath`, tức thuộc tính giúp một object trong store trở nên duy nhất. Thuộc tính đó trong ví dụ này là "ssn" vì số an sinh xã hội được đảm bảo là duy nhất. "ssn" phải có mặt trên mọi object được lưu trong `objectStore`.

Chúng ta cũng yêu cầu một index tên "name" nhìn vào thuộc tính `name` của các object được lưu. Tương tự như `createObjectStore()`, `createIndex()` nhận một object `options` tùy chọn để tinh chỉnh kiểu index bạn muốn tạo. Việc thêm các object không có thuộc tính `name` vẫn thành công, nhưng các object đó sẽ không xuất hiện trong index "name".

Bây giờ chúng ta có thể truy xuất các object khách hàng đã lưu bằng `ssn` trực tiếp từ object store, hoặc bằng tên thông qua index. Để tìm hiểu cách làm, xem phần [dùng index](#using_an_index).

### Dùng key generator

Thiết lập cờ `autoIncrement` khi tạo object store sẽ kích hoạt key generator cho object store đó. Theo mặc định, cờ này không được đặt.

Với key generator, key sẽ được tạo tự động khi bạn thêm giá trị vào object store. Số hiện tại của key generator luôn được đặt là `1` khi object store cho key generator đó được tạo lần đầu. Nói đơn giản, key tự sinh mới sẽ tăng thêm `1` dựa trên key trước đó. Số hiện tại của key generator không bao giờ giảm, trừ khi kết quả của các thao tác cơ sở dữ liệu bị hoàn tác, ví dụ transaction cơ sở dữ liệu bị hủy. Vì vậy, xóa một bản ghi hay thậm chí xóa sạch toàn bộ bản ghi khỏi object store sẽ không bao giờ ảnh hưởng đến key generator của object store.

Chúng ta có thể tạo thêm một object store khác với key generator như sau:

```js
// Mở indexedDB.
const request = indexedDB.open(dbName, 3);

request.onupgradeneeded = (event) => {
  const db = event.target.result;

  // Tạo thêm một object store tên "names" với cờ autoIncrement được đặt là true.
  const objStore = db.createObjectStore("names", { autoIncrement: true });

  // Vì object store "names" có key generator, key cho giá trị name sẽ được tạo tự động.
  // Các bản ghi được thêm sẽ giống như:
  // key : 1 => value : "Bill"
  // key : 2 => value : "Donna"
  customerData.forEach((customer) => {
    objStore.add(customer.name);
  });
};
```

Để biết thêm chi tiết về key generator, xem [Key generators](https://w3c.github.io/IndexedDB/#key-generator-construct) trong đặc tả.

## Thêm, truy xuất và xóa dữ liệu

Trước khi bạn có thể làm gì với cơ sở dữ liệu mới của mình, bạn cần bắt đầu một transaction. Transaction được tạo từ đối tượng cơ sở dữ liệu, và bạn phải chỉ định object store nào mà transaction sẽ bao phủ. Khi đã ở trong transaction, bạn có thể truy cập object store chứa dữ liệu của mình và thực hiện các request. Tiếp theo, bạn cần quyết định liệu bạn sẽ thay đổi cơ sở dữ liệu hay chỉ đọc từ nó. Transaction có ba chế độ: `readonly`, `readwrite`, và `versionchange`.

Để thay đổi "schema" hay cấu trúc của cơ sở dữ liệu, tức tạo hoặc xóa object store hay index, transaction phải ở chế độ `versionchange`. Transaction này được mở bằng cách gọi phương thức {{domxref("IDBFactory.open")}} với version được chỉ định.

Để đọc các bản ghi của một object store hiện có, transaction có thể ở chế độ `readonly` hoặc `readwrite`. Để thay đổi một object store hiện có, transaction phải ở chế độ `readwrite`. Bạn mở các transaction như vậy bằng {{domxref("IDBDatabase.transaction")}}. Phương thức này nhận hai tham số: `storeNames` (scope, được định nghĩa là một mảng các object store mà bạn muốn truy cập) và `mode` (`readonly` hoặc `readwrite`) cho transaction. Phương thức trả về một đối tượng transaction chứa phương thức {{domxref("IDBIndex.objectStore")}}, mà bạn có thể dùng để truy cập object store của mình. Theo mặc định, nếu không chỉ định mode, transaction sẽ mở ở chế độ `readonly`.

> [!NOTE]
> Kể từ Firefox 40, các transaction IndexedDB có cơ chế đảm bảo durability nới lỏng hơn để tăng hiệu năng (xem [Firefox bug 1112702](https://bugzil.la/1112702).) Trước đây, trong một transaction `readwrite`, sự kiện {{domxref("IDBTransaction.complete_event", "complete")}} chỉ được phát khi mọi dữ liệu được đảm bảo đã ghi xuống đĩa. Trong Firefox 40+, sự kiện `complete` được phát sau khi hệ điều hành được yêu cầu ghi dữ liệu nhưng có thể trước khi dữ liệu đó thực sự được ghi xuống đĩa. Vì vậy, sự kiện `complete` có thể đến nhanh hơn trước, nhưng vẫn tồn tại một khả năng nhỏ rằng toàn bộ transaction sẽ bị mất nếu hệ điều hành bị treo hoặc bị mất điện trước khi dữ liệu được ghi xuống đĩa. Vì những sự cố nghiêm trọng như vậy hiếm gặp, phần lớn người dùng không cần lo thêm về điều này. Nếu vì lý do nào đó bạn bắt buộc phải bảo đảm durability, ví dụ đang lưu dữ liệu quan trọng không thể tính lại sau này, bạn có thể buộc transaction ghi xuống đĩa trước khi phát sự kiện `complete` bằng cách tạo transaction với chế độ thử nghiệm (không chuẩn) `readwriteflush` (xem {{domxref("IDBDatabase.transaction")}}).

Bạn có thể tăng tốc truy cập dữ liệu bằng cách dùng đúng scope và mode trong transaction. Dưới đây là một vài mẹo:

- Khi xác định scope, chỉ chỉ định những object store bạn cần. Như vậy, bạn có thể chạy nhiều transaction có scope không chồng lấn đồng thời.
- Chỉ chỉ định mode transaction `readwrite` khi thật sự cần. Bạn có thể chạy đồng thời nhiều transaction `readonly` với scope chồng lấn, nhưng với một object store, bạn chỉ có thể có một transaction `readwrite`. Để tìm hiểu thêm, xem định nghĩa [transaction](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#transaction) trong bài [Đặc tính key và thuật ngữ cơ bản của IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology).

### Thêm dữ liệu vào cơ sở dữ liệu

Nếu bạn vừa tạo một cơ sở dữ liệu, thì có lẽ bạn sẽ muốn ghi dữ liệu vào đó. Đây là cách nó trông như thế:

```js
const transaction = db.transaction(["customers"], "readwrite");
// Lưu ý: Các triển khai thử nghiệm cũ dùng hằng số đã bị loại bỏ IDBTransaction.READ_WRITE thay cho "readwrite".
// Nếu bạn muốn hỗ trợ triển khai như vậy, bạn có thể viết:
// const transaction = db.transaction(["customers"], IDBTransaction.READ_WRITE);
```

Hàm `transaction()` nhận hai đối số (mặc dù một đối số là tùy chọn) và trả về một đối tượng transaction. Đối số đầu tiên là danh sách các object store mà transaction sẽ bao phủ. Bạn có thể truyền một mảng rỗng nếu muốn transaction bao phủ toàn bộ object store, nhưng đừng làm vậy vì đặc tả nói rằng một mảng rỗng sẽ sinh ra lỗi `InvalidAccessError`. Nếu bạn không chỉ định gì cho đối số thứ hai, bạn sẽ nhận được một transaction chỉ-đọc. Vì ở đây bạn muốn ghi dữ liệu, bạn cần truyền cờ `"readwrite"`.

Bây giờ bạn đã có transaction, bạn cần hiểu vòng đời của nó. Transaction gắn rất chặt với event loop. Nếu bạn tạo transaction rồi quay lại event loop mà không dùng nó, transaction sẽ trở nên không hoạt động. Cách duy nhất để giữ transaction hoạt động là tạo một request trên nó. Khi request hoàn tất, bạn sẽ nhận được một sự kiện DOM và, giả sử request thành công, bạn sẽ có một cơ hội khác để kéo dài transaction trong callback đó. Nếu bạn quay lại event loop mà không kéo dài transaction thì nó sẽ trở nên không hoạt động, và cứ thế tiếp tục. Miễn là còn các request đang chờ, transaction vẫn hoạt động. Vòng đời transaction thực ra khá đơn giản nhưng có thể cần một chút thời gian để quen. Một vài ví dụ thêm nữa cũng sẽ hữu ích. Nếu bạn bắt đầu thấy mã lỗi `TRANSACTION_INACTIVE_ERR` thì là bạn đã làm sai ở đâu đó.

Transaction có thể nhận sự kiện DOM của ba loại khác nhau: `error`, `abort`, và `complete`. Chúng ta đã nói về cách sự kiện `error` lan lên cha, nên một transaction sẽ nhận các sự kiện lỗi từ bất kỳ request nào được tạo từ nó. Một điểm tinh tế hơn là hành vi mặc định của lỗi là hủy transaction mà nó xảy ra trong đó. Trừ khi bạn xử lý lỗi bằng cách trước tiên gọi `stopPropagation()` trên sự kiện lỗi rồi làm gì đó khác, toàn bộ transaction sẽ bị hoàn tác. Thiết kế này buộc bạn phải suy nghĩ và xử lý lỗi, nhưng bạn luôn có thể thêm một trình xử lý lỗi bao quát trên database nếu việc xử lý lỗi chi tiết quá rườm rà. Nếu bạn không xử lý một sự kiện lỗi hoặc nếu bạn gọi `abort()` trên transaction, transaction sẽ bị hoàn tác và một sự kiện `abort` sẽ được phát trên transaction. Ngược lại, sau khi mọi request đang chờ đã hoàn tất, bạn sẽ nhận được sự kiện `complete`. Nếu bạn thực hiện nhiều thao tác cơ sở dữ liệu, việc theo dõi transaction thay vì từng request riêng lẻ chắc chắn sẽ giúp đầu óc bạn nhẹ nhàng hơn.

Bây giờ bạn đã có transaction, bạn sẽ cần lấy object store từ nó. Transaction chỉ cho phép bạn có object store mà bạn đã chỉ định khi tạo transaction. Sau đó bạn có thể thêm mọi dữ liệu cần thiết.

```js
// Làm gì đó khi mọi dữ liệu đã được thêm vào cơ sở dữ liệu.
transaction.oncomplete = (event) => {
  console.log("All done!");
};

transaction.onerror = (event) => {
  // Đừng quên xử lý lỗi!
};

const objectStore = transaction.objectStore("customers");
customerData.forEach((customer) => {
  const request = objectStore.add(customer);
  request.onsuccess = (event) => {
    // event.target.result === customer.ssn;
  };
});
```

## Xem thêm

- [Đặc tả Indexed Database API](https://w3c.github.io/IndexedDB/)
