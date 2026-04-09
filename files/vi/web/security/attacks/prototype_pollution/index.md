---
title: Prototype pollution JavaScript
slug: Web/Security/Attacks/Prototype_pollution
page-type: guide
sidebar: security
---

**Prototype pollution** là một lỗ hổng cho phép kẻ tấn công thêm hoặc sửa thuộc tính trên prototype của một đối tượng. Điều này có nghĩa là các giá trị độc hại có thể xuất hiện ngoài dự kiến trên các đối tượng trong ứng dụng của bạn, thường dẫn đến lỗi logic hoặc các cuộc tấn công bổ sung như [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

## Prototype trong JavaScript

JavaScript triển khai {{glossary("inheritance")}} bằng _prototype_. Mỗi đối tượng đều có một tham chiếu đến một prototype, bản thân prototype đó cũng là một đối tượng, và chính nó lại có một prototype, cứ như vậy cho đến khi ta tới prototype cơ sở, được gọi là `Object.prototype`, mà prototype của chính nó là `null`.

Nếu bạn cố truy cập một thuộc tính hoặc gọi một phương thức trên một đối tượng, và thuộc tính hoặc phương thức đó không được định nghĩa trên đối tượng, thì môi trường chạy JavaScript sẽ tìm trong prototype của đối tượng để lấy thuộc tính hoặc phương thức đó, rồi tiếp tục tìm trong prototype của prototype của đối tượng, và cứ tiếp tục như vậy cho đến khi tìm thấy thuộc tính hoặc phương thức, hoặc chạm tới một đối tượng có prototype là `null`.

Đó là lý do bạn có thể làm như sau:

```js
const mySet = new Set([1, 2, 3]);
// prototype chain:
// mySet -> Set.prototype -> Object.prototype -> null

mySet.size;
// 3
// size is defined on the prototype of `mySet`, which is `Set.prototype`

mySet.propertyIsEnumerable("size");
// false
// propertyIsEnumerable() is defined on the prototype
// of `Set.prototype`, which is `Object.prototype`
```

Không giống nhiều ngôn ngữ khác, JavaScript cho phép bạn thêm các thuộc tính và phương thức được kế thừa ở thời gian chạy bằng cách sửa các prototype của đối tượng:

```js example-bad
const mySet = new Set([1, 2, 3]);

// modify the Object prototype at runtime
Object.prototype.extra = "new property from the Object prototype!";

// modify the Set prototype at runtime
Set.prototype.other = "new property from the Set prototype!";

mySet.extra;
// "new property from the Object prototype!"

mySet.other;
// "new property from the Set prototype!"
```

Trong một cuộc tấn công prototype pollution, kẻ tấn công thay đổi một prototype tích hợp sẵn như `Object.prototype`, khiến tất cả các đối tượng dẫn xuất có thêm một thuộc tính mới, bao gồm cả những đối tượng mà kẻ tấn công không có quyền truy cập trực tiếp.

> [!NOTE]
> Để tìm hiểu kỹ hơn về prototype, xem:
>
> - [Object prototypes](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes)
> - [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
> - [Working with objects](/en-US/docs/Web/JavaScript/Guide/Working_with_objects)

## Cấu trúc của prototype pollution

Prototype pollution gồm hai giai đoạn:

1. **Pollution**: Kẻ tấn công có thể thêm hoặc sửa thuộc tính trên prototype của một đối tượng.
2. **Exploitation**: Mã gốc của ứng dụng truy cập các thuộc tính đã bị nhiễm, dẫn đến hành vi không mong muốn.

### Nguồn gây nhiễm

Để làm nhiễm các đối tượng, kẻ tấn công cần có cách thêm thuộc tính tùy ý vào các đối tượng prototype. Điều này có thể xảy ra do [XSS](/en-US/docs/Web/Security/Attacks/XSS), trong đó kẻ tấn công có quyền truy cập trực tiếp vào môi trường thực thi JavaScript của trang. Tuy nhiên, với mức truy cập như vậy, kẻ tấn công có thể gây hại theo những cách trực tiếp hơn nhiều, nên prototype pollution thường được bàn tới như một cuộc tấn công _chỉ dữ liệu_, trong đó kẻ tấn công tạo một payload được mã ứng dụng xử lý, dẫn đến việc bị nhiễm.

Một vector tấn công quan trọng là thuộc tính [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto), vốn cho phép truy cập prototype của một đối tượng bất kỳ. Bạn cũng có thể đi tới prototype thông qua `yourObject.constructor.prototype`. Mẫu mã chính tạo ra nguồn gây nhiễm là việc sửa đổi thuộc tính động theo kiểu sau:

```js
obj[key1][key2] = value;
```

Trong trường hợp này, nếu `obj` là một đối tượng thông thường, `key1` là `"__proto__"`, và `key2` là một tên thuộc tính như `"test"`, thì mã sẽ thêm một thuộc tính tên `test` vào `Object.prototype`, vốn là prototype của mọi đối tượng thông thường. Ngay cả khi bộ đặt [`"__proto__"` bị vô hiệu hóa](#node.js_flag_--disable-proto), mẫu truy cập `.constructor.prototype` vẫn có thể được dùng để đi tới prototype, mà với các đối tượng thông thường thì đó cũng là `Object.prototype`:

```js
obj[key1][key2][key3] = value;
```

...trong đó `key1` là `"constructor"`, `key2` là `"prototype"`, và `key3` là một tên thuộc tính như `"test"`.

Để đặt dòng mã này vào ngữ cảnh cụ thể hơn, `key1`, `key2`, và `key3` có thể là các giá trị do kẻ tấn công kiểm soát. Ví dụ, hãy tưởng tượng một endpoint API nhận vào một danh sách tên người dùng, và một danh sách các trường cần truy vấn cho mỗi người dùng, rồi trả về một đối tượng ánh xạ mỗi tên người dùng tới các trường của họ:

```js
function getUsers(request) {
  const result = {};
  const userNames = new URL(request.url).searchParams.getAll("names");
  const fields = new URL(request.url).searchParams.getAll("fields");
  for (const name of userNames) {
    const userInfo = database.lookup(name);
    result[name] ??= {};
    for (const field of fields) {
      // Pollution source
      result[name][field] = userInfo[field];
    }
  }
  return result;
}
```

Bây giờ, nếu kẻ tấn công gọi API này với URL `https://example.com/api?names=__proto__&fields=age`, mã sẽ thêm một thuộc tính tên `age` vào `Object.prototype`, với giá trị là bất kỳ gì thuộc tính `age` của người dùng `__proto__` có. Giá trị đó có thể là `undefined`, nhưng nếu kẻ tấn công có thể thêm một người dùng tên `__proto__` vào cơ sở dữ liệu (ví dụ qua một API khác), họ có thể kiểm soát giá trị của thuộc tính `age`.

Nhiều thư viện thực hiện [phân tích tùy chỉnh các chuỗi truy vấn URL](https://github.com/BlackFan/client-side-prototype-pollution) đặc biệt dễ bị tấn công, vì chúng cho phép chỉ định cấu trúc đối tượng sâu qua chuỗi truy vấn, rồi dùng sửa đổi thuộc tính động để tạo đối tượng, chẳng hạn `?__proto__[test]=test` hoặc `?__proto__.test=test`. Nhìn chung, thư viện dễ bị tấn công hơn mã ứng dụng, vì chúng không thể allowlist các khóa hợp lệ, và thường phải dùng sửa đổi thuộc tính động để đủ tổng quát.

Lưu ý rằng trong [JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON), thuộc tính `__proto__` chỉ là một tên thuộc tính bình thường, nên việc phân tích payload JSON như `{"__proto__": {"test": "value"}}` chỉ tạo ra một đối tượng có thuộc tính tên `__proto__`, và không gây vấn đề ngay lập tức. Tuy nhiên, nếu sau đó trong mã, đối tượng này được gộp vào một đối tượng khác thông qua {{jsxref("Object.assign()")}}, vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in), v.v., thì thao tác gán thuộc tính ngầm sẽ kích hoạt bộ đặt. Thông thường, điều này thực ra không sửa `Object.prototype` vì chỉ có một tầng truy cập thuộc tính động, nhưng nó có thay đổi prototype của đối tượng đích. Lưu ý rằng [spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) không dễ bị kiểu tấn công này, vì spread không kích hoạt setters.

```js
// Just an object with a property called `__proto__`
const options = JSON.parse('{"__proto__": {"test": "value"}}');
const withDefaults = Object.assign({ mode: "cors" }, options);
// In the process of merging `options`, we indirectly executed
// withDefaults.__proto__ = { test: "value" }, causing `withDefaults` to have
// a different prototype
console.log(withDefaults.test); // "value"
```

### Mục tiêu khai thác

Để thấy tác động của prototype pollution, ta có thể xem cách lời gọi {{domxref("fetch()")}} sau có thể bị thay đổi hoàn toàn. Theo mặc định, đây là một yêu cầu {{HTTPMethod("GET")}} không có dữ liệu để gửi tới máy chủ, nhưng vì chúng ta đã làm nhiễm đối tượng `Object.prototype` với hai thuộc tính mặc định mới, lời gọi `fetch()` giờ bị biến thành một yêu cầu {{HTTPMethod("POST")}} và phần thân yêu cầu giờ chứa các chỉ thị cho máy chủ, ví dụ để chuyển một số tiền tùy ý đến một địa chỉ tùy ý:

```js
// Attacker indirectly causes the following pollution
Object.prototype.body = "action=transfer&amount=1337&to=1337-1337-1337-1337";
Object.prototype.method = "POST";

fetch("https://example.com", {
  mode: "cors",
});
// Promise {status: "pending", body: "action=transfer&amount=1337&to=1337-1337-1337-1337", method: "POST"}

// Any new object initialization is now modified to contain additional default properties
console.log({}.method); // "POST"
console.log({}.body); // "action=transfer&amount=1337&to=1337-1337-1337-1337"
```

Một mục tiêu tấn công nguy hiểm khác là thuộc tính {{domxref("HTMLIframeElement.srcdoc")}}, vốn chỉ định nội dung của một phần tử {{HTMLElement("iframe")}}. Bằng cách ghi đè giá trị của nó, có thể thực thi mã tùy ý.

```js
Object.prototype.srcdoc = "<script>alert(1)<\/script>";
```

Các đối tượng cấu hình, như đối tượng {{domxref("RequestInit")}} của `fetch()` trong ví dụ mã ở trên, hoặc việc khởi tạo `<iframes>`, hoặc cấu hình bộ làm sạch (các đối tượng {{domxref("SanitizerConfig")}}), là những đối tượng nhạy cảm nhất và thường là mục tiêu của các cuộc tấn công prototype pollution. Các đối tượng dữ liệu cũng có thể bị nhiễm:

```js
function accessDashboard(user) {
  if (!user.isAdmin) {
    return new Response("Access denied", { status: 403 });
  }
  // show admin page
}
```

Nếu `Object.prototype.isAdmin` được đặt thành `true`, và thuộc tính `isAdmin` bị thiếu đối với người dùng không phải quản trị viên thay vì được đặt rõ ràng thành `false`, thì tất cả người dùng sẽ bị coi là quản trị viên, dẫn đến việc bỏ qua hoàn toàn kiểm soát truy cập.

## Phòng vệ chống prototype pollution

Phòng vệ chống prototype pollution đi theo hai hướng: tránh mã có thể biến thành sửa đổi prototype, và tránh truy cập các thuộc tính có khả năng đã bị nhiễm. Phần sau trình bày một số chiến lược mà bạn có thể dùng tùy theo tình huống.

### Xác thực đầu vào người dùng

Luôn xác thực đầu vào người dùng bằng các bộ validator, chẳng hạn [ajv](https://ajv.js.org) và [Zod](https://zod.dev/), để bảo đảm cấu trúc dữ liệu đầu vào chứa đúng các thuộc tính với đúng kiểu. Để giảm thiểu tấn công prototype pollution, hãy từ chối các thuộc tính không cần thiết bằng cách đặt `additionalProperties` thành `false` trong schema. Dùng schema cũng cho phép đặt giá trị mặc định cho các thuộc tính bị thiếu, giúp tránh tra cứu qua prototype.

Bạn nên tránh sửa đổi thuộc tính động (dạng `obj[key] = value`) trừ khi bạn có thể xác thực các giá trị `key`. Nếu rơi vào tình huống này, bạn có thể loại trừ `__proto__`, `constructor`, `prototype` như các khóa trong quá trình xác thực.

### Cờ Node.js `--disable-proto`

Nếu bạn đang ở môi trường Node.js, bạn có thể vô hiệu hóa `Object.prototype.__proto__` bằng tùy chọn `--disable-proto=MODE`, trong đó `MODE` là `delete` (thuộc tính bị xóa hoàn toàn), hoặc `throw` (các lần truy cập thuộc tính sẽ ném một ngoại lệ với mã `ERR_PROTO_ACCESS`). Dùng `delete Object.prototype.__proto__` trong môi trường không phải Node để có cùng hiệu quả.

Điều này không bảo vệ bạn hoàn toàn khỏi prototype pollution (vì `constructor.prototype` vẫn còn), nhưng nó loại bỏ một điểm vào như vậy.

### Khóa chặt các đối tượng tích hợp sẵn

Các môi trường có mức nhạy cảm cao có thể triển khai một cơ chế phòng vệ gọi là _realm lockdown_ để ngăn mọi sửa đổi đối với các đối tượng tích hợp sẵn. Một ví dụ là shim [SES](https://github.com/endojs/endo/tree/master/packages/ses#ses) cho [Hardened JavaScript](https://hardenedjs.org). Cơ chế này được triển khai dựa trên hàm {{jsxref("Object.freeze()")}}, hàm này ngăn mở rộng và làm cho các thuộc tính hiện có không thể ghi và không thể cấu hình. Việc freeze một đối tượng là mức toàn vẹn cao nhất mà JavaScript cung cấp. Ngoài ra, {{jsxref("Object.seal()")}} cho phép thay đổi các thuộc tính hiện có, miễn là chúng có thể ghi, trong khi {{jsxref("Object.preventExtensions()")}} ngăn không cho thêm thuộc tính mới vào một đối tượng.

```js
Object.freeze(Object.prototype);
const obj = {};
const key1 = "__proto__";
const key2 = "a";
obj[key1][key2] = 1; // fails silently in non-strict mode
obj.a; // undefined
```

Tuy nhiên, lưu ý rằng việc sửa đổi prototype hợp lệ có thể xảy ra, thường là để cung cấp một triển khai {{glossary("Polyfill")}}. Trong [chế độ không nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode), các nỗ lực sửa đổi đối tượng đã freeze sẽ thất bại âm thầm, còn trong chế độ nghiêm ngặt, chúng ném ra `TypeError`. Để cho phép polyfill, mã polyfill cần chạy trước khi freeze.

Một lưu ý khác với {{jsxref("Object.freeze()")}} là nó không cung cấp deep freeze theo mặc định. Nếu bạn muốn bất biến thực sự, bạn cần đệ quy freeze mọi thuộc tính ([ví dụ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze#deep_freezing)). Một thư viện như SES được ưu tiên hơn vì nó thực hiện "walk" qua toàn bộ các đối tượng tích hợp sẵn, tránh bỏ sót đối tượng nào cần freeze.

### Tránh tra cứu trên prototype

Trong mã nơi bạn truy cập thuộc tính của đối tượng, hãy bảo đảm bạn biết thuộc tính đó tồn tại trên chính đối tượng đó. Bạn có thể thực hiện kiểm tra {{jsxref("Object.hasOwn()")}} khi truy cập hoặc duyệt các khóa trên đối tượng.

Thay vì:

```js example-bad
if (!user.isAdmin) {
  return new Response("Access denied", { status: 403 });
}
```

Hãy cân nhắc:

```js
if (!Object.hasOwn(user, "isAdmin") || !user.isAdmin) {
  return new Response("Access denied", { status: 403 });
}
```

Khi lặp, vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) sẽ duyệt qua prototype. Nếu có thể, hãy thay các vòng lặp như vậy bằng [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) và {{jsxref("Object.keys()")}} để chỉ duyệt các khóa thuộc về chính đối tượng.

```js
// Looks up the prototype
for (const key in payload) {
  doSomething(payload[key]);
}

// Only visits own keys
for (const key of Object.keys(payload)) {
  doSomething(payload[key]);
}
```

Trong các hàm, hãy đặt rõ giá trị mặc định của tham số thay vì để chúng là `undefined`. Bằng cách này, các giá trị mặc định của tham số có thể được dùng thay vì phải tra cứu tiềm năng trên prototype chain. Thay vì thế này:

```js example-bad
function doDangerousAction(options = {}) {
  if (!options.enableDangerousAction) {
    return;
  }
}
```

Hãy cân nhắc thế này:

```js
function doDangerousAction(options = { enableDangerousAction: false }) {
  if (!options.enableDangerousAction) {
    return;
  }
}
```

### Tạo đối tượng JavaScript với prototype null

[Đối tượng không có prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) đồng thời tránh prototype pollution (vì các thuộc tính `__proto__` và `constructor` không tồn tại trên đối tượng) và tránh tra cứu trên prototype. Chúng được tạo либо bằng hàm {{jsxref("Object.create()", "Object.create(null)")}}, hoặc bằng cú pháp `{ __proto__: null }` trong object initializer.

> [!NOTE]
> Cú pháp `{ __proto__: null }` [bộ đặt prototype](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter) trong object initializer là hoàn toàn an toàn, không giống thuộc tính truy cập `obj.__proto__`.

Nếu bạn cần truyền một đối tượng như là options (ví dụ, vì một API như `fetch()` yêu cầu bạn dùng một đối tượng), hãy tạo một đối tượng có prototype null. Lưu ý rằng việc tạo đối tượng không có prototype không phải là mặc định, nên mỗi khi khởi tạo đối tượng, bạn cần nhớ tạo rõ một đối tượng có prototype null thay vì object initializer thông thường (`const myObj = {}`).

```js
Object.prototype.method = "POST";

// Still sends a GET request, because the object has no prototype
fetch("https://example.com", {
  __proto__: null,
  mode: "cors",
});
```
