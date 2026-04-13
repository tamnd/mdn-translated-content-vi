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

<a id="opening_a_database"></a>
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

<a id="creating_or_updating_the_version_of_the_database"></a>
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

Với key generator, key sẽ được tạo tự động khi bạn thêm giá trị vào object store. Số hiện tại của key generator luôn là `1` khi object store dùng key generator đó được tạo lần đầu. Nói đơn giản, key tự sinh mới sẽ tăng thêm `1` dựa trên key trước đó. Giá trị hiện tại của key generator không bao giờ giảm, trừ khi kết quả của một thao tác cơ sở dữ liệu bị hoàn tác, ví dụ transaction cơ sở dữ liệu bị hủy. Vì vậy, việc xóa một bản ghi hay thậm chí xóa sạch toàn bộ bản ghi khỏi object store sẽ không bao giờ ảnh hưởng đến key generator của object store.

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

### Xóa dữ liệu khỏi cơ sở dữ liệu

Xóa dữ liệu rất giống với thêm dữ liệu:

```js
const request = db
  .transaction(["customers"], "readwrite")
  .objectStore("customers")
  .delete("444-44-4444");
request.onsuccess = (event) => {
  // Nó đã biến mất!
};
```

### Lấy dữ liệu từ cơ sở dữ liệu

Bây giờ cơ sở dữ liệu đã có dữ liệu, bạn có thể truy xuất nó theo nhiều cách. Trước hết là `get()` đơn giản. Bạn cần cung cấp key để lấy giá trị, như sau:

```js
const transaction = db.transaction(["customers"]);
const objectStore = transaction.objectStore("customers");
const request = objectStore.get("444-44-4444");
request.onerror = (event) => {
  // Xử lý lỗi!
};
request.onsuccess = (event) => {
  // Làm gì đó với request.result!
  console.log(`Tên cho SSN 444-44-4444 là ${request.result.name}`);
};
```

Đây là khá nhiều mã cho một thao tác "đơn giản". Dưới đây là cách rút gọn đôi chút, giả sử bạn xử lý lỗi ở cấp cơ sở dữ liệu:

```js
db
  .transaction("customers")
  .objectStore("customers")
  .get("444-44-4444").onsuccess = (event) => {
  console.log(`Tên cho SSN 444-44-4444 là ${event.target.result.name}`);
};
```

Bạn thấy nó hoạt động thế nào rồi chứ? Vì chỉ có một object store, bạn có thể tránh truyền một danh sách object store vào transaction và chỉ cần truyền tên dưới dạng chuỗi. Ngoài ra, vì bạn chỉ đọc từ cơ sở dữ liệu, bạn không cần transaction `"readwrite"`. Gọi `transaction()` mà không chỉ định mode sẽ tạo một transaction `"readonly"`. Một điểm tinh tế khác là bạn thực ra không lưu đối tượng request vào biến. Vì sự kiện DOM có request làm target, bạn có thể dùng `event` để truy cập thuộc tính `result`.

<a id="updating_an_entry_in_the_database"></a>

### Cập nhật một mục trong cơ sở dữ liệu

Bây giờ chúng ta đã truy xuất được dữ liệu, việc cập nhật và ghi nó trở lại IndexedDB khá đơn giản. Hãy cập nhật ví dụ trước đó một chút:

```js
const objectStore = db
  .transaction(["customers"], "readwrite")
  .objectStore("customers");
const request = objectStore.get("444-44-4444");
request.onerror = (event) => {
  // Xử lý lỗi!
};
request.onsuccess = (event) => {
  // Lấy giá trị cũ mà chúng ta muốn cập nhật
  const data = event.target.result;

  // cập nhật (các) giá trị trong object mà bạn muốn thay đổi
  data.age = 42;

  // Đưa object đã cập nhật này trở lại cơ sở dữ liệu.
  const requestUpdate = objectStore.put(data);
  requestUpdate.onerror = (event) => {
    // Làm gì đó với lỗi
  };
  requestUpdate.onsuccess = (event) => {
    // Thành công - dữ liệu đã được cập nhật!
  };
};
```

Ở đây chúng ta tạo `objectStore` và yêu cầu một bản ghi khách hàng từ nó, được xác định bằng giá trị ssn của nó (`444-44-4444`). Sau đó, chúng ta lưu kết quả của request đó vào một biến (`data`), cập nhật thuộc tính `age` của object này, rồi tạo một request thứ hai (`requestUpdate`) để ghi bản ghi khách hàng trở lại `objectStore`, ghi đè giá trị trước đó.

> [!NOTE]
> Trong trường hợp này, chúng ta phải chỉ định transaction `readwrite` vì chúng ta muốn ghi vào cơ sở dữ liệu, không chỉ đọc từ nó.

<a id="using_a_cursor"></a>

### Dùng một con trỏ

Dùng `get()` yêu cầu bạn phải biết chính xác key muốn truy xuất. Nếu bạn muốn duyệt qua toàn bộ các giá trị trong object store của mình, bạn có thể dùng cursor. Nó trông như sau:

```js
const objectStore = db.transaction("customers").objectStore("customers");

objectStore.openCursor().onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    console.log(`Tên cho SSN ${cursor.key} là ${cursor.value.name}`);
    cursor.continue();
  } else {
    console.log("Không còn mục nào nữa!");
  }
};
```

Hàm `openCursor()` nhận vài đối số. Trước hết, bạn có thể giới hạn phạm vi các mục được truy xuất bằng một object key range, phần này sẽ nói ngay sau đây. Thứ hai, bạn có thể chỉ định hướng muốn lặp. Trong ví dụ trên, chúng ta lặp qua tất cả các object theo thứ tự tăng dần. Callback thành công của cursor hơi đặc biệt một chút. Bản thân cursor object là `result` của request (ở trên chúng ta dùng dạng rút gọn, nên là `event.target.result`). Sau đó key và value thực tế nằm trong các thuộc tính `key` và `value` của cursor object. Nếu bạn muốn tiếp tục, bạn phải gọi `continue()` trên cursor. Khi đã tới cuối dữ liệu (hoặc nếu không có mục nào khớp với request `openCursor()`) bạn vẫn nhận được callback thành công, nhưng thuộc tính `result` sẽ là `undefined`.

Một mẫu thường gặp với cursor là lấy tất cả object trong một object store và thêm chúng vào một mảng, như thế này:

```js
const customers = [];

objectStore.openCursor().onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    customers.push(cursor.value);
    cursor.continue();
  } else {
    console.log(`Đã lấy toàn bộ khách hàng: ${customers}`);
  }
};
```

> [!NOTE]
> Ngoài ra, bạn có thể dùng `getAll()` để xử lý trường hợp này (và `getAllKeys()`). Mã sau làm đúng y như trên:
>
> ```js
> objectStore.getAll().onsuccess = (event) => {
>   console.log(`Đã lấy toàn bộ khách hàng: ${event.target.result}`);
> };
> ```
>
> Việc truy cập thuộc tính `value` của cursor có một chi phí hiệu năng, vì object được tạo theo kiểu lazy. Khi dùng `getAll()`, trình duyệt phải tạo tất cả object cùng lúc. Nếu bạn chỉ quan tâm đến từng key, chẳng hạn, thì dùng cursor sẽ hiệu quả hơn nhiều so với `getAll()`. Tuy nhiên, nếu bạn đang cố lấy một mảng gồm tất cả object trong object store, hãy dùng `getAll()`.

<a id="using_an_index"></a>

### Dùng một index

Lưu dữ liệu khách hàng bằng SSN làm key là hợp lý, vì SSN xác định duy nhất một cá nhân. (Việc đó có tốt cho quyền riêng tư hay không là một câu chuyện khác, và nằm ngoài phạm vi bài viết này.) Tuy nhiên, nếu bạn cần tìm một khách hàng theo tên, bạn sẽ phải duyệt qua toàn bộ SSN trong cơ sở dữ liệu cho đến khi tìm được người đúng. Cách tìm như vậy sẽ rất chậm, nên thay vào đó bạn có thể dùng index.

```js
// Trước tiên, hãy chắc chắn rằng bạn đã tạo index trong request.onupgradeneeded:
// objectStore.createIndex("name", "name");
// Nếu không bạn sẽ nhận được DOMException.

const index = objectStore.index("name");

index.get("Donna").onsuccess = (event) => {
  console.log(`SSN của Donna là ${event.target.result.ssn}`);
};
```

Index "name" không duy nhất, nên có thể có hơn một mục có `name` là `"Donna"`. Trong trường hợp đó, bạn luôn nhận được mục có giá trị key thấp nhất.

Nếu bạn cần truy cập tất cả mục có cùng một `name`, bạn có thể dùng cursor. Bạn có thể mở hai loại cursor khác nhau trên index. Cursor thường ánh xạ thuộc tính của index tới object trong object store. Key cursor ánh xạ thuộc tính của index tới key dùng để lưu object trong object store. Sự khác nhau được minh họa như sau:

```js
// Dùng cursor thường để lấy toàn bộ object bản ghi khách hàng
index.openCursor().onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // cursor.key là một tên, như "Bill", và cursor.value là toàn bộ object.
    console.log(
      `Tên: ${cursor.key}, SSN: ${cursor.value.ssn}, email: ${cursor.value.email}`,
    );
    cursor.continue();
  }
};

// Dùng key cursor để lấy các key của object bản ghi khách hàng
index.openKeyCursor().onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // cursor.key là một tên, như "Bill", và cursor.primaryKey là SSN.
    // Không có cách nào lấy trực tiếp phần còn lại của object đã lưu.
    console.log(`Tên: ${cursor.key}, SSN: ${cursor.primaryKey}`);
    cursor.continue();
  }
};
```

Index cũng có thể được tạo trên nhiều thuộc tính, cho phép tra cứu bản ghi bằng sự kết hợp của nhiều giá trị, chẳng hạn tìm một người bằng cả tên lẫn email. Để tạo compound index, hãy truyền một mảng tên thuộc tính làm key path khi gọi `createIndex`. Sau đó bạn có thể truy vấn index bằng cách truyền một mảng các giá trị theo đúng thứ tự.

Trước tiên, hãy chắc chắn rằng bạn đã tạo index trong `request.onupgradeneeded`:

```js
const index = objectStore.createIndex("name_email", ["name", "email"]);
```

Sau đó bạn có thể truy vấn index như sau:

```js
const index = objectStore.index("name_email");

index.get(["Donna", "donna@home.org"]).onsuccess = (event) => {
  console.log(event.target.result);
  // {ssn: '555-55-5555', name: 'Donna', age: 32, email: 'donna@home.org'}
};
```

<a id="specifying_the_range_and_direction_of_cursors"></a>

### Chỉ định phạm vi và hướng của cursor

Nếu bạn muốn giới hạn phạm vi các giá trị mà cursor thấy, bạn có thể dùng một object `IDBKeyRange` và truyền nó làm đối số đầu tiên cho `openCursor()` hoặc `openKeyCursor()`. Bạn có thể tạo key range chỉ cho phép một key duy nhất, hoặc có cận dưới, cận trên, hoặc cả hai. Cận có thể là "closed" (tức key range bao gồm giá trị được chỉ định) hoặc "open" (tức key range không bao gồm giá trị đó). Cách dùng như sau:

```js
// Chỉ khớp "Donna"
const singleKeyRange = IDBKeyRange.only("Donna");

// Khớp mọi giá trị sau "Bill", bao gồm cả "Bill"
const lowerBoundKeyRange = IDBKeyRange.lowerBound("Bill");

// Khớp mọi giá trị sau "Bill", nhưng không bao gồm "Bill"
const lowerBoundOpenKeyRange = IDBKeyRange.lowerBound("Bill", true);

// Khớp mọi giá trị tới "Donna", nhưng không bao gồm "Donna"
const upperBoundOpenKeyRange = IDBKeyRange.upperBound("Donna", true);

// Khớp mọi giá trị giữa "Bill" và "Donna", nhưng không bao gồm "Donna"
const boundKeyRange = IDBKeyRange.bound("Bill", "Donna", false, true);

// Để dùng một trong các key range này, hãy truyền nó làm đối số đầu tiên của openCursor()/openKeyCursor()
index.openCursor(boundKeyRange).onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // Làm gì đó với các kết quả khớp.
    cursor.continue();
  }
};
```

Đôi khi bạn muốn lặp theo thứ tự giảm dần thay vì tăng dần (hướng mặc định của mọi cursor). Việc đổi hướng được thực hiện bằng cách truyền `prev` vào hàm `openCursor()` làm đối số thứ hai:

```js
objectStore.openCursor(boundKeyRange, "prev").onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // Làm gì đó với các mục.
    cursor.continue();
  }
};
```

Nếu bạn chỉ muốn đổi hướng nhưng không giới hạn kết quả hiển thị, bạn có thể truyền `null` làm đối số đầu tiên:

```js
objectStore.openCursor(null, "prev").onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // Làm gì đó với các mục.
    cursor.continue();
  }
};
```

Vì index "name" không duy nhất, có thể có nhiều mục có cùng `name`. Lưu ý rằng tình huống này không thể xảy ra với object store vì key phải luôn là duy nhất. Nếu bạn muốn lọc các bản ghi trùng lặp trong lúc duyệt cursor trên index, bạn có thể truyền `nextunique` (hoặc `prevunique` nếu bạn đang đi lùi) làm tham số hướng. Khi dùng `nextunique` hoặc `prevunique`, mục có key thấp nhất luôn là mục được trả về.

```js
index.openKeyCursor(null, "nextunique").onsuccess = (event) => {
  const cursor = event.target.result;
  if (cursor) {
    // Làm gì đó với các mục.
    cursor.continue();
  }
};
```

Vui lòng xem "[IDBCursor Constants](/en-US/docs/Web/API/IDBCursor#constants)" để biết các giá trị hướng hợp lệ.

<a id="version_changes_while_a_web_app_is_open_in_another_tab"></a>

## Thay đổi version khi một web app đang mở ở tab khác

Khi ứng dụng web của bạn thay đổi đến mức cần một version mới cho cơ sở dữ liệu, bạn cần cân nhắc điều gì sẽ xảy ra nếu người dùng đang mở version cũ của ứng dụng trong một tab và sau đó tải version mới ở tab khác. Khi bạn gọi `open()` với version lớn hơn version hiện tại của cơ sở dữ liệu, mọi cơ sở dữ liệu đang mở khác phải xác nhận rõ ràng yêu cầu trước khi bạn có thể bắt đầu thay đổi cơ sở dữ liệu (sự kiện `onblocked` sẽ được phát cho đến khi chúng bị đóng hoặc tải lại). Cách nó hoạt động như sau:

```js
const openReq = mozIndexedDB.open("MyTestDatabase", 2);

openReq.onblocked = (event) => {
  // Nếu có tab khác đang mở site này với cơ sở dữ liệu, thì tab đó cần được đóng
  // trước khi chúng ta có thể tiếp tục.
  console.log("Vui lòng đóng tất cả tab khác đang mở site này!");
};

openReq.onupgradeneeded = (event) => {
  // Tất cả cơ sở dữ liệu khác đã bị đóng. Hãy thiết lập mọi thứ.
  db.createObjectStore(/* … */);
  useDatabase(db);
};

openReq.onsuccess = (event) => {
  const db = event.target.result;
  useDatabase(db);
};

function useDatabase(db) {
  // Hãy đảm bảo thêm một trình xử lý để được báo khi một trang khác yêu cầu thay đổi version.
  // Chúng ta phải đóng cơ sở dữ liệu. Điều này cho phép trang kia nâng cấp cơ sở dữ liệu.
  // Nếu bạn không làm vậy thì việc nâng cấp sẽ không xảy ra cho tới khi người dùng đóng tab.
  db.onversionchange = (event) => {
    db.close();
    console.log(
      "Một version mới của trang này đã sẵn sàng. Vui lòng tải lại hoặc đóng tab này!",
    );
  };

  // Làm việc với cơ sở dữ liệu.
}
```

Bạn cũng nên lắng nghe lỗi `VersionError` để xử lý trường hợp các ứng dụng đã mở có thể khởi tạo mã dẫn đến một lần mở cơ sở dữ liệu mới, nhưng lại dùng một version đã cũ.

<a id="security"></a>

## Bảo mật

IndexedDB sử dụng nguyên tắc cùng origin, nghĩa là nó ràng buộc kho lưu trữ với origin của site tạo ra nó (thường là domain hoặc subdomain của site đó), nên các origin khác không thể truy cập.

Nội dung cửa sổ của bên thứ ba (ví dụ nội dung {{htmlelement("iframe")}}) không thể truy cập IndexedDB nếu trình duyệt được đặt ở chế độ [không bao giờ chấp nhận cookie của bên thứ ba](https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection) (xem [Firefox bug 1147821](https://bugzil.la/1147821)).

<a id="warning_about_browser_shutdown"></a>

## Cảnh báo khi trình duyệt tắt

Khi trình duyệt tắt (do người dùng chọn Quit hoặc Exit), ổ đĩa chứa cơ sở dữ liệu bị gỡ bất ngờ, hoặc quyền truy cập vào kho lưu trữ dữ liệu bị mất, những điều sau sẽ xảy ra:

1. Mọi transaction trên mọi cơ sở dữ liệu bị ảnh hưởng (hoặc tất cả cơ sở dữ liệu đang mở, trong trường hợp trình duyệt tắt) sẽ bị hủy với `AbortError`. Hiệu ứng giống hệt như khi gọi {{domxref("IDBTransaction.abort()")}} trên từng transaction.
2. Khi tất cả transaction đã hoàn tất, kết nối cơ sở dữ liệu sẽ bị đóng.
3. Cuối cùng, đối tượng {{domxref("IDBDatabase")}} đại diện cho kết nối cơ sở dữ liệu sẽ nhận một sự kiện {{domxref("IDBDatabase/close_event", "close")}}. Bạn có thể dùng trình xử lý sự kiện {{domxref("IDBDatabase.close_event", "IDBDatabase.onclose")}} để lắng nghe các sự kiện này, để bạn biết khi nào một cơ sở dữ liệu bị đóng bất ngờ.

Hành vi mô tả ở trên là mới và chỉ có từ các bản phát hành trình duyệt sau: Firefox 50, Google Chrome 31 (xấp xỉ).

Trước các phiên bản trình duyệt này, transaction bị hủy âm thầm và không có sự kiện {{domxref("IDBDatabase/close_event", "close")}} nào được phát, nên không có cách nào phát hiện việc cơ sở dữ liệu bị đóng bất ngờ.

Vì người dùng có thể thoát trình duyệt bất kỳ lúc nào, điều đó có nghĩa là bạn không thể dựa vào bất kỳ transaction cụ thể nào để chắc chắn hoàn tất, và trên các trình duyệt cũ hơn, thậm chí bạn còn không được báo khi chúng không hoàn tất. Hành vi này dẫn đến một số hệ quả.

Trước hết, bạn nên luôn cố gắng giữ cơ sở dữ liệu ở trạng thái nhất quán vào cuối mỗi transaction. Ví dụ, giả sử bạn dùng IndexedDB để lưu danh sách các mục mà người dùng có thể sửa. Bạn lưu danh sách sau khi chỉnh sửa bằng cách xóa sạch object store rồi ghi danh sách mới vào. Nếu bạn xóa object store trong một transaction và ghi danh sách mới trong transaction khác, có nguy cơ trình duyệt sẽ đóng sau khi xóa nhưng trước khi ghi, khiến cơ sở dữ liệu của bạn rỗng. Để tránh điều này, bạn nên gộp thao tác xóa và ghi vào cùng một transaction.

Thứ hai, bạn không bao giờ nên gắn transaction cơ sở dữ liệu với các sự kiện unload. Nếu sự kiện unload được kích hoạt do trình duyệt đang đóng, bất kỳ transaction nào được tạo trong handler của unload sẽ không bao giờ hoàn tất. Một cách nghĩ trực quan để giữ một số thông tin qua nhiều phiên trình duyệt là đọc nó từ cơ sở dữ liệu khi trình duyệt (hoặc một trang cụ thể) mở, cập nhật khi người dùng tương tác, rồi lưu lại khi trình duyệt (hoặc trang) đóng. Tuy nhiên, cách này sẽ không hoạt động. Transaction cơ sở dữ liệu sẽ được tạo trong handler của unload, nhưng vì chúng bất đồng bộ nên chúng sẽ bị hủy trước khi kịp thực thi.

Thực tế là không có cách nào bảo đảm transaction IndexedDB sẽ hoàn tất, kể cả với việc tắt trình duyệt bình thường. Xem [Firefox bug 870645](https://bugzil.la/870645). Như một cách xử lý tạm cho thông báo tắt bình thường này, bạn có thể theo dõi transaction và thêm sự kiện `beforeunload` để cảnh báo người dùng nếu còn transaction nào chưa hoàn tất tại thời điểm đóng trang.

Ít nhất, với sự bổ sung của các thông báo hủy và {{domxref("IDBDatabase.close_event", "IDBDatabase.onclose")}}, bạn có thể biết khi điều đó đã xảy ra.

<a id="full_indexeddb_example"></a>

## Ví dụ đầy đủ về IndexedDB

Chúng ta có một ví dụ hoàn chỉnh sử dụng IndexedDB API. Ví dụ này dùng IndexedDB để lưu và truy xuất các ấn phẩm.

- [Thử ví dụ](https://mdn.github.io/dom-examples/indexeddb-api/index.html)
- [Xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/indexeddb-api)

## Xem thêm

Đọc thêm nếu bạn muốn biết nhiều hơn.

### Tài liệu tham chiếu

- [Tài liệu tham chiếu IndexedDB API](/en-US/docs/Web/API/IndexedDB_API)
- [Đặc tả Indexed Database API](https://w3c.github.io/IndexedDB/)
- Các [file giao diện](https://searchfox.org/firefox-main/search?q=dom%2FindexedDB%2F.*%5C.idl&path=&case=false&regexp=true) của IndexedDB trong mã nguồn Firefox

### Hướng dẫn và bài viết

- [Databinding UI Elements with IndexedDB (2012)](https://web.dev/articles/indexeddb-uidatabinding)
- [IndexedDB — The Store in Your Browser](<https://learn.microsoft.com/en-us/previous-versions/msdn10/gg679063(v=msdn.10)>)

### Thư viện

- [localForage](https://localforage.github.io/localForage/): Một polyfill cung cấp cú pháp đơn giản name:value cho lưu trữ dữ liệu phía client, dùng IndexedDB ở nền, nhưng sẽ chuyển sang Web SQL (đã lỗi thời) rồi localStorage trên các trình duyệt không hỗ trợ IndexedDB.
- [Dexie.js](https://dexie.org/): Một wrapper cho IndexedDB giúp phát triển mã nhanh hơn nhiều nhờ cú pháp đơn giản, dễ dùng.
- [JsStore](https://jsstore.net/): Một wrapper IndexedDB đơn giản nhưng mạnh, có cú pháp giống SQL.
- [MiniMongo](https://github.com/mWater/minimongo): Cơ sở dữ liệu MongoDB trong bộ nhớ phía client, được hậu thuẫn bởi localStorage và đồng bộ với server qua http. MiniMongo được MeteorJS sử dụng.
- [PouchDB](https://pouchdb.com/): Một triển khai CouchDB phía client trong trình duyệt, dùng IndexedDB
- [IDB](https://github.com/jakearchibald/idb): Một thư viện nhỏ chủ yếu mô phỏng IndexedDB API nhưng cải thiện khả năng sử dụng ở một số điểm.
- [idb-keyval](https://www.npmjs.com/package/idb-keyval): Một kho lưu trữ key-value cực kỳ nhỏ, dựa trên promise, (~600B) được triển khai bằng IndexedDB
- [$mol_db](https://github.com/hyoo-ru/mam_mol/tree/master/db): Lớp vỏ TypeScript rất nhỏ (~1.3kB) với API dựa trên promise và cơ chế migration tự động.
- [RxDB](https://rxdb.info/): Một cơ sở dữ liệu NoSQL phía client có thể dùng trên IndexedDB. Hỗ trợ index, nén và đồng bộ. Ngoài ra còn thêm khả năng hoạt động đa tab và quan sát cho IndexedDB.
