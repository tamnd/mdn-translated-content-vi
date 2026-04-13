---
title: Các đặc tính key và thuật ngữ cơ bản của IndexedDB
slug: Web/API/IndexedDB_API/Basic_Terminology
page-type: guide
---

{{DefaultAPISidebar("IndexedDB")}}

Bài viết này mô tả các đặc tính key chính của IndexedDB và giới thiệu một số thuật ngữ thiết yếu để hiểu API IndexedDB.

Bạn cũng có thể thấy các bài viết sau hữu ích:

- Để xem hướng dẫn chi tiết về cách dùng API, hãy xem [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB).
- Để xem tài liệu tham chiếu về API IndexedDB, hãy quay lại bài viết chính [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) và các trang con của nó, nơi mô tả các kiểu đối tượng được IndexedDB sử dụng.
- Để biết thêm về cách trình duyệt xử lý việc lưu dữ liệu của bạn ở nền, hãy đọc [Hạn mức lưu trữ của trình duyệt và tiêu chí loại bỏ dữ liệu](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).

## Đặc tính chính

IndexedDB là một cách để bạn lưu trữ dữ liệu lâu dài bên trong trình duyệt của người dùng. Vì nó cho phép bạn tạo các ứng dụng web có khả năng truy vấn phong phú bất kể có kết nối mạng hay không, ứng dụng của bạn có thể hoạt động cả khi trực tuyến lẫn ngoại tuyến. IndexedDB hữu ích cho các ứng dụng lưu một lượng dữ liệu lớn, chẳng hạn danh mục DVD của thư viện cho mượn, và cho các ứng dụng không cần kết nối internet liên tục để hoạt động, chẳng hạn ứng dụng thư, danh sách việc cần làm, và sổ ghi chú.

IndexedDB cho phép bạn lưu và truy xuất các đối tượng được đánh chỉ mục bằng một "key". Mọi thay đổi bạn thực hiện lên cơ sở dữ liệu đều xảy ra trong các transaction. Giống như hầu hết các giải pháp lưu trữ web, IndexedDB tuân theo [same-origin policy](https://www.w3.org/Security/wiki/Same_Origin_Policy). Vì vậy, trong khi bạn có thể truy cập dữ liệu đã lưu trong cùng một miền, bạn không thể truy cập dữ liệu giữa các miền khác nhau.

Nếu bạn mang theo giả định từ các loại cơ sở dữ liệu khác, bạn có thể bị "lệch pha" khi làm việc với IndexedDB. Vì vậy, các đặc tính chính sau đây của IndexedDB rất quan trọng:

- **Cơ sở dữ liệu IndexedDB lưu các cặp key-value.** Giá trị có thể là các đối tượng có cấu trúc phức tạp, và key có thể là thuộc tính của các đối tượng đó. Bạn có thể tạo các index dùng bất kỳ thuộc tính nào của đối tượng để tìm kiếm nhanh, cũng như để liệt kê theo thứ tự. Key có thể là đối tượng nhị phân.
- **IndexedDB được xây dựng trên mô hình cơ sở dữ liệu giao dịch.** Mọi thứ bạn làm trong IndexedDB luôn xảy ra trong ngữ cảnh của một [transaction](#transaction). API IndexedDB cung cấp nhiều đối tượng đại diện cho index, table, cursor, v.v., nhưng mỗi đối tượng này đều gắn với một transaction cụ thể. Vì vậy, bạn không thể thực thi lệnh hay mở cursor bên ngoài transaction. Transaction có vòng đời xác định rõ, nên cố dùng transaction sau khi nó hoàn tất sẽ ném ra ngoại lệ. Transaction cũng tự commit nếu không có yêu cầu mới nào được tạo khi transaction đang hoạt động.

  Mô hình transaction này thực sự rất hữu ích khi bạn nghĩ đến chuyện một người dùng mở hai phiên bản ứng dụng web của bạn ở hai tab khác nhau cùng lúc. Nếu không có thao tác giao dịch, hai phiên bản có thể can thiệp vào các thay đổi của nhau. Nếu bạn chưa quen với transaction trong cơ sở dữ liệu, hãy đọc bài [Wikipedia về database transaction](https://en.wikipedia.org/wiki/Database_transaction). Xem thêm mục [transaction](#transaction) trong phần Định nghĩa.

- **API IndexedDB chủ yếu là bất đồng bộ.** API không trả dữ liệu bằng cách trả về giá trị; thay vào đó, bạn phải truyền một hàm callback. Bạn không "lưu" một giá trị vào cơ sở dữ liệu, cũng không "lấy" một giá trị ra khỏi cơ sở dữ liệu bằng cách đồng bộ. Thay vào đó, bạn "yêu cầu" một thao tác cơ sở dữ liệu xảy ra. Bạn được thông báo bằng một sự kiện DOM khi thao tác hoàn tất, và loại sự kiện bạn nhận được cho biết thao tác thành công hay thất bại.
- **IndexedDB dùng rất nhiều request.** Request là các đối tượng nhận các sự kiện DOM thành công hoặc thất bại đã nói ở trên. Chúng có các thuộc tính `onsuccess` và `onerror`, và bạn có thể gọi `addEventListener()` và `removeEventListener()` trên chúng. Chúng cũng có các thuộc tính `readyState`, `result`, và `errorCode` cho biết trạng thái của request. Thuộc tính `result` đặc biệt "kỳ diệu", vì nó có thể là nhiều thứ khác nhau, tùy thuộc vào cách request được tạo ra, ví dụ một thể hiện `IDBCursor`, hoặc key cho giá trị bạn vừa chèn vào cơ sở dữ liệu.
- **IndexedDB dùng sự kiện DOM để thông báo cho bạn khi có kết quả.** Sự kiện DOM luôn có thuộc tính `type` (trong IndexedDB, thường là `"success"` hoặc `"error"`). Sự kiện DOM cũng có thuộc tính `target` cho biết sự kiện đang hướng tới đâu. Trong hầu hết trường hợp, `target` của sự kiện là đối tượng `IDBRequest` được tạo ra từ một thao tác cơ sở dữ liệu nào đó. Sự kiện thành công không lan lên cha và không thể bị hủy. Ngược lại, sự kiện lỗi có lan lên cha và có thể bị hủy. Điều này rất quan trọng, vì sự kiện lỗi sẽ hủy bất kỳ transaction nào mà chúng đang chạy, trừ khi chúng bị hủy.
- **IndexedDB là hướng đối tượng.** IndexedDB không phải là một cơ sở dữ liệu quan hệ với các bảng đại diện cho tập hợp các hàng và cột. Sự khác biệt quan trọng và nền tảng này ảnh hưởng đến cách bạn thiết kế và xây dựng ứng dụng.

  Trong một kho dữ liệu quan hệ truyền thống, bạn sẽ có một bảng lưu tập hợp các hàng dữ liệu và các cột của kiểu dữ liệu được đặt tên. IndexedDB, ngược lại, yêu cầu bạn tạo một object store cho một kiểu dữ liệu và lưu các đối tượng JavaScript vào object store đó. Mỗi object store có thể có một tập các index giúp truy vấn và duyệt qua dữ liệu hiệu quả hơn. Nếu bạn chưa quen với hệ quản trị cơ sở dữ liệu hướng đối tượng, hãy đọc bài [Wikipedia về object database](https://en.wikipedia.org/wiki/Object_database).

- **IndexedDB không dùng Structured Query Language (SQL).** Nó dùng các truy vấn trên một index tạo ra một cursor, và bạn dùng cursor đó để duyệt qua tập kết quả. Nếu bạn chưa quen với các hệ NoSQL, hãy đọc bài [Wikipedia về NoSQL](https://en.wikipedia.org/wiki/NoSQL).
- **IndexedDB tuân thủ same-origin policy.** Origin là miền, giao thức lớp ứng dụng và cổng của URL của tài liệu nơi script đang được thực thi. Mỗi origin có một tập cơ sở dữ liệu đi kèm riêng. Mỗi cơ sở dữ liệu có một tên để nhận diện nó trong phạm vi một origin.

  Rào chắn bảo mật do IndexedDB đặt ra ngăn ứng dụng truy cập dữ liệu có origin khác. Ví dụ, trong khi một ứng dụng hoặc trang ở `http://www.example.com/app/` có thể truy xuất dữ liệu từ `http://www.example.com/dir/`, vì chúng có cùng origin, nó không thể truy xuất dữ liệu từ `http://www.example.com:8080/dir/` (khác cổng) hoặc `https://www.example.com/dir/` (khác giao thức), vì chúng có origin khác nhau.

  > [!NOTE]
  > Nội dung cửa sổ bên thứ ba (ví dụ nội dung {{htmlelement("iframe")}}) có thể truy cập kho IndexedDB cho origin mà nó được nhúng vào, trừ khi trình duyệt được đặt thành [never accept third party cookies](https://support.mozilla.org/en-US/kb/third-party-cookies-firefox-tracking-protection) (xem [Firefox bug 1147821](https://bugzil.la/1147821)).

### Hạn chế

IndexedDB được thiết kế để đáp ứng phần lớn các trường hợp cần lưu trữ phía client. Tuy nhiên, nó không phù hợp cho một số trường hợp như sau:

- Sắp xếp theo ngôn ngữ. Không phải mọi ngôn ngữ đều sắp xếp chuỗi theo cùng một cách, nên việc sắp xếp quốc tế hóa không được hỗ trợ. Mặc dù cơ sở dữ liệu không thể lưu dữ liệu theo một thứ tự quốc tế hóa cụ thể, bạn vẫn có thể tự sắp xếp dữ liệu đã đọc ra khỏi cơ sở dữ liệu.
- Đồng bộ hóa. API này không được thiết kế để tự đồng bộ với một cơ sở dữ liệu phía máy chủ. Bạn phải viết mã để đồng bộ cơ sở dữ liệu IndexedDB phía client với cơ sở dữ liệu phía máy chủ.
- Tìm kiếm toàn văn. API này không có tương đương với toán tử `LIKE` trong SQL.

Ngoài ra, hãy lưu ý rằng trình duyệt có thể xóa cơ sở dữ liệu trong các điều kiện như sau:

- Người dùng yêu cầu xóa. Nhiều trình duyệt có cài đặt cho phép người dùng xóa mọi dữ liệu được lưu cho một website nhất định, bao gồm cookie, bookmark, mật khẩu đã lưu, và dữ liệu IndexedDB.
- Trình duyệt đang ở chế độ duyệt riêng tư. Một số trình duyệt có chế độ "private browsing" (Firefox) hoặc "incognito" (Chrome). Khi phiên kết thúc, trình duyệt sẽ xóa cơ sở dữ liệu.
- Đã đạt đến giới hạn đĩa hoặc hạn mức.
- Dữ liệu bị hỏng.
- Có thay đổi không tương thích với tính năng.

Các hoàn cảnh chính xác và khả năng của trình duyệt thay đổi theo thời gian, nhưng triết lý chung của nhà cung cấp trình duyệt là cố gắng hết sức để giữ dữ liệu khi có thể.

## Thuật ngữ cốt lõi

Phần này định nghĩa và giải thích thuật ngữ cốt lõi liên quan đến việc hiểu API IndexedDB.

### Cơ sở dữ liệu

#### database

Kho thông tin, thường gồm một hoặc nhiều [_object store_](#object_store). Mỗi cơ sở dữ liệu phải có:

- Tên. Tên này xác định cơ sở dữ liệu trong một origin cụ thể và giữ nguyên trong suốt vòng đời của nó. Tên có thể là bất kỳ chuỗi nào, kể cả chuỗi rỗng.
- [_Version_](#version) hiện tại. Khi một cơ sở dữ liệu được tạo lần đầu, version của nó là số nguyên `1` nếu không được chỉ định khác. Mỗi cơ sở dữ liệu chỉ có thể có một version tại một thời điểm.

#### database connection

Một thao tác được tạo bằng cách mở một _[database](#database)_. Một cơ sở dữ liệu có thể có nhiều connection cùng lúc.

#### durable

Trong Firefox, IndexedDB trước đây là **durable**, nghĩa là trong một transaction readwrite, sự kiện {{domxref("IDBTransaction.complete_event", "complete")}} chỉ được phát khi mọi dữ liệu được đảm bảo đã ghi xuống đĩa.

Kể từ Firefox 40, các transaction IndexedDB có cơ chế đảm bảo durability "nới lỏng" hơn để tăng hiệu năng (xem [Firefox bug 1112702](https://bugzil.la/1112702)), và đây cũng là hành vi của các trình duyệt khác hỗ trợ IndexedDB. Trong trường hợp này, sự kiện {{domxref("IDBTransaction.complete_event", "complete")}} được phát sau khi hệ điều hành được yêu cầu ghi dữ liệu nhưng có thể trước khi dữ liệu đó thực sự được ghi xuống đĩa. Vì vậy sự kiện có thể đến nhanh hơn trước, nhưng vẫn tồn tại một khả năng nhỏ rằng toàn bộ transaction sẽ bị mất nếu hệ điều hành bị treo hoặc mất nguồn trước khi dữ liệu được ghi xuống đĩa. Vì những sự cố nghiêm trọng như vậy hiếm gặp, phần lớn người dùng không cần quá lo lắng về điều này.

> [!NOTE]
> Trong Firefox, nếu bạn vì lý do nào đó muốn đảm bảo durability, chẳng hạn khi lưu dữ liệu quan trọng không thể tính lại sau này, bạn có thể buộc transaction ghi xuống đĩa trước khi phát sự kiện `complete` bằng cách tạo transaction với chế độ thử nghiệm (không chuẩn) `readwriteflush` (xem {{domxref("IDBDatabase.transaction")}}). Hiện tại đây vẫn là thử nghiệm, và chỉ dùng được nếu pref `dom.indexedDB.experimental` được đặt thành `true` trong `about:config`.

#### index

Index là một object store chuyên biệt dùng để tra cứu bản ghi trong object store khác, gọi là _referenced object store_. Index là một kho key-value bền vững, trong đó phần value của các bản ghi chính là phần key của một bản ghi trong referenced object store. Các bản ghi trong một index sẽ được tự động điền khi bản ghi trong referenced object store được chèn, cập nhật hoặc xóa. Mỗi bản ghi trong một index chỉ có thể trỏ đến một bản ghi trong referenced object store của nó, nhưng nhiều index có thể tham chiếu cùng một object store. Khi object store thay đổi, mọi index tham chiếu đến nó đều được cập nhật tự động.

Ngoài ra, bạn cũng có thể tra cứu bản ghi trong object store bằng [key](#key).

Để tìm hiểu thêm về cách dùng index, xem [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB#using_an_index). Để xem tài liệu tham chiếu về index, xem [IDBKeyRange](/en-US/docs/Web/API/IDBKeyRange).

#### object store

Cơ chế dùng để lưu dữ liệu trong cơ sở dữ liệu. Object store lưu bền vững các record, là các cặp key-value. Các record trong object store được sắp xếp theo _[keys](#key)_ theo thứ tự tăng dần.

Mỗi object store phải có một tên duy nhất trong cơ sở dữ liệu của nó. Object store có thể tùy chọn có _[key generator](#key_generator)_ và _[key path](#key_path)_. Nếu object store có key path, nó đang dùng _[in-line keys](#in-line_key)_; nếu không, nó đang dùng _[out-of-line keys](#out-of-line_key)_.

Để xem tài liệu tham chiếu về object store, xem {{domxref("IDBObjectStore")}}.

#### request

Thao tác dùng để đọc và ghi trên cơ sở dữ liệu. Mỗi request đại diện cho một thao tác đọc hoặc ghi.

#### transaction

Một tập hợp nguyên tử các thao tác truy cập và chỉnh sửa dữ liệu trên một cơ sở dữ liệu cụ thể. Đây là cách bạn tương tác với dữ liệu trong cơ sở dữ liệu. Thực tế, mọi thao tác đọc hoặc thay đổi dữ liệu trong cơ sở dữ liệu đều phải diễn ra trong một transaction.

Một kết nối cơ sở dữ liệu có thể có nhiều transaction đang hoạt động cùng lúc, miễn là các transaction ghi không có [_scope_](#scope) chồng lấn. Scope của transaction, được xác định khi tạo, quyết định những object store nào transaction có thể tương tác và giữ nguyên trong suốt vòng đời của transaction. Ví dụ, nếu một kết nối cơ sở dữ liệu đã có một transaction ghi với scope chỉ bao gồm object store `flyingMonkey`, bạn vẫn có thể bắt đầu một transaction thứ hai với scope là hai object store `unicornCentaur` và `unicornPegasus`. Với transaction đọc, bạn có thể có nhiều transaction cùng lúc, kể cả khi scope chồng lấn.

Transaction được kỳ vọng là ngắn hạn, để trình duyệt có thể kết thúc một transaction kéo dài quá lâu nhằm giải phóng tài nguyên lưu trữ mà transaction dài hạn đó đã khóa. Bạn có thể abort transaction, thao tác này sẽ hoàn tác các thay đổi đã được thực hiện trong transaction. Và bạn thậm chí không cần đợi transaction bắt đầu hay hoạt động để abort nó.

Ba chế độ của transaction là: `readwrite`, `readonly`, và `versionchange`. Cách duy nhất để tạo và xóa object store và index là dùng transaction [`versionchange`](/en-US/docs/Web/API/IDBDatabase/versionchange_event). Để tìm hiểu thêm về các kiểu transaction, xem bài tham khảo [IndexedDB](/en-US/docs/Web/API/IndexedDB_API).

Vì mọi thứ đều xảy ra trong một transaction, đây là một khái niệm rất quan trọng trong IndexedDB. Để tìm hiểu thêm về transaction, đặc biệt là cách nó liên quan đến versioning, xem {{domxref("IDBTransaction")}}, nơi cũng có tài liệu tham chiếu.

#### version

Khi một cơ sở dữ liệu được tạo lần đầu, version của nó là số nguyên `1`. Mỗi cơ sở dữ liệu chỉ có một version tại một thời điểm; một cơ sở dữ liệu không thể tồn tại ở nhiều version cùng lúc. Cách duy nhất để thay đổi version là mở nó với version lớn hơn version hiện tại.

### Key và value

#### in-line key

Một key được lưu như một phần của giá trị được lưu. Nó được tìm thông qua một _key path_. Một in-line key có thể được tạo bằng generator. Sau khi key được tạo, nó có thể được lưu trong value bằng key path hoặc cũng có thể được dùng làm key.

#### key

Một giá trị dữ liệu dùng để tổ chức và truy xuất các giá trị được lưu trong object store. Object store có thể lấy key từ một trong ba nguồn: một _[key generator](#key_generator)_, một _[key path](#key_path)_, hoặc một giá trị được chỉ định rõ ràng. Key phải thuộc kiểu dữ liệu mà số của nó lớn hơn số trước đó. Mỗi record trong object store phải có một key duy nhất trong cùng store, vì vậy bạn không thể có nhiều record cùng key trong một object store nhất định.

Key có thể là một trong các kiểu sau: [string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), [date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), số thực, binary blob, và [array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array). Với array, key có thể nằm trong phạm vi từ giá trị rỗng đến vô hạn. Và bạn có thể lồng một array trong một array khác.

Ngoài ra, bạn cũng có thể tra cứu bản ghi trong object store bằng _[index](#index)_.

#### key generator

Cơ chế sinh key mới theo một chuỗi có thứ tự. Nếu object store không có key generator, ứng dụng phải cung cấp key cho các bản ghi được lưu. Generator không được chia sẻ giữa các store. Đây chủ yếu là chi tiết triển khai của trình duyệt, vì trong phát triển web bạn thật ra không tự tạo hay truy cập key generator.

#### key path

Xác định nơi trình duyệt nên trích xuất key từ object store hoặc index. Một key path hợp lệ có thể gồm một trong các giá trị sau: chuỗi rỗng, một định danh JavaScript, hoặc nhiều định danh JavaScript được phân tách bằng dấu chấm, hoặc một mảng chứa các giá trị đó. Nó không được chứa khoảng trắng.

#### out-of-line key

Một key được lưu tách biệt khỏi giá trị đang được lưu.

#### value

Mỗi record có một value, có thể bao gồm bất kỳ thứ gì có thể biểu diễn trong JavaScript, gồm [boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean), [number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), [string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), [date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), [object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object), [array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), [regexp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp), [undefined](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined), và null.

Khi một object hoặc array được lưu, các thuộc tính và giá trị bên trong object hoặc array đó cũng có thể là bất kỳ giá trị hợp lệ nào.

[Blob](/en-US/docs/Web/API/Blob) và file cũng có thể được lưu, xem [specification](https://w3c.github.io/IndexedDB/).

### Range và scope

#### cursor

Cơ chế để lặp qua nhiều bản ghi với một _key range_. Cursor có một nguồn cho biết nó đang lặp qua index hay object store nào. Nó có một vị trí trong phạm vi, và di chuyển theo hướng tăng hoặc giảm trong thứ tự key của record. Để xem tài liệu tham chiếu về cursor, xem {{domxref("IDBCursor")}}.

#### key range

Một khoảng liên tục trên một kiểu dữ liệu nào đó được dùng cho key. Record có thể được truy xuất từ object store và index bằng key hoặc một dải key. Bạn có thể giới hạn hoặc lọc dải này bằng cận dưới và cận trên. Ví dụ, bạn có thể lặp qua mọi giá trị của một key giữa x và y.

Để xem tài liệu tham chiếu về key range, xem {{domxref("IDBKeyRange")}}.

#### scope

Tập hợp các object store và index mà một transaction áp dụng. Scope của transaction chỉ-đọc có thể chồng lấn và chạy cùng lúc. Ngược lại, scope của transaction ghi không được chồng lấn. Bạn vẫn có thể bắt đầu nhiều transaction có cùng scope cùng lúc, nhưng chúng chỉ xếp hàng và thực thi lần lượt.

## Các bước tiếp theo

Với việc đã hiểu các đặc tính key và thuật ngữ cốt lõi của IndexedDB, giờ chúng ta có thể đi đến những nội dung cụ thể hơn. Để xem hướng dẫn sử dụng API, hãy xem [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB).

## Xem thêm

- [Đặc tả Indexed Database API](https://w3c.github.io/IndexedDB/)
- [IndexedDB API Reference](/en-US/docs/Web/API/IndexedDB_API)
- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- [IndexedDB — The Store in Your Browser](<https://learn.microsoft.com/en-us/previous-versions/msdn10/gg679063(v=msdn.10)>)
