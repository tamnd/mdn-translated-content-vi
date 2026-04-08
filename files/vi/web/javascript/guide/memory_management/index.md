---
title: Memory management
slug: Web/JavaScript/Guide/Memory_management
page-type: guide
sidebar: jssidebar
---

Các ngôn ngữ cấp thấp như C có các hàm quản lý bộ nhớ thủ công như [`malloc()`](https://pubs.opengroup.org/onlinepubs/009695399/functions/malloc.html) và [`free()`](https://en.wikipedia.org/wiki/C_dynamic_memory_allocation#Overview_of_functions). Ngược lại, JavaScript tự động cấp phát bộ nhớ khi các đối tượng được tạo và giải phóng khi chúng không còn được sử dụng nữa (_garbage collection_). Tính tự động này là nguồn gốc tiềm ẩn của sự nhầm lẫn: nó có thể tạo cho các lập trình viên ấn tượng sai rằng họ không cần lo lắng về quản lý bộ nhớ.

## Vòng đời bộ nhớ

Bất kể ngôn ngữ lập trình nào, vòng đời bộ nhớ hầu như luôn giống nhau:

1. Cấp phát bộ nhớ bạn cần
2. Sử dụng bộ nhớ đã cấp phát (đọc, ghi)
3. Giải phóng bộ nhớ đã cấp phát khi không còn cần thiết

Phần thứ hai là tường minh trong tất cả các ngôn ngữ. Phần đầu và phần cuối là tường minh trong các ngôn ngữ cấp thấp nhưng hầu hết là ngầm định trong các ngôn ngữ cấp cao như JavaScript.

### Cấp phát trong JavaScript

#### Khởi tạo giá trị

Để không làm phiền lập trình viên với việc cấp phát, JavaScript sẽ tự động cấp phát bộ nhớ khi các giá trị được khai báo ban đầu.

```js
const n = 123; // allocates memory for a number
const s = "string"; // allocates memory for a string

const o = {
  a: 1,
  b: null,
}; // allocates memory for an object and contained values

// (like object) allocates memory for the array and
// contained values
const a = [1, null, "str2"];

function f(a) {
  return a + 2;
} // allocates a function (which is a callable object)

// function expressions also allocate an object
someElement.addEventListener("click", () => {
  someElement.style.backgroundColor = "blue";
});
```

#### Cấp phát thông qua lời gọi hàm

Một số lời gọi hàm dẫn đến cấp phát đối tượng.

```js
const d = new Date(); // allocates a Date object

const e = document.createElement("div"); // allocates a DOM element
```

Một số phương thức cấp phát các giá trị hoặc đối tượng mới:

```js
const s = "string";
const s2 = s.substring(0, 3); // s2 is a new string
// Since strings are immutable values,
// JavaScript may decide to not allocate memory,
// but just store the [0, 3] range.

const a = ["yeah yeah", "no no"];
const a2 = ["generation", "no no"];
const a3 = a.concat(a2);
// new array with 4 elements being
// the concatenation of a and a2 elements.
```

### Sử dụng các giá trị

Sử dụng các giá trị về cơ bản có nghĩa là đọc và ghi trong bộ nhớ đã cấp phát. Điều này có thể được thực hiện bằng cách đọc hoặc ghi giá trị của một biến hoặc một thuộc tính đối tượng, hoặc thậm chí truyền một đối số cho một hàm.

### Giải phóng khi bộ nhớ không còn cần thiết

Phần lớn các vấn đề quản lý bộ nhớ xảy ra ở giai đoạn này. Khía cạnh khó khăn nhất của giai đoạn này là xác định khi nào bộ nhớ đã cấp phát không còn cần thiết nữa.

Các ngôn ngữ cấp thấp yêu cầu lập trình viên phải xác định thủ công tại điểm nào trong chương trình bộ nhớ đã cấp phát không còn cần thiết nữa và giải phóng nó.

Một số ngôn ngữ cấp cao, như JavaScript, sử dụng một hình thức quản lý bộ nhớ tự động được gọi là [garbage collection](<https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)>) (GC). Mục đích của một garbage collector là theo dõi việc cấp phát bộ nhớ và xác định khi nào một khối bộ nhớ đã cấp phát không còn cần thiết nữa và lấy lại nó. Quá trình tự động này là một xấp xỉ vì vấn đề chung của việc xác định liệu một phần bộ nhớ cụ thể có còn cần thiết hay không là [không thể quyết định](https://en.wikipedia.org/wiki/Decidability_%28logic%29).

## Garbage collection

Như đã nêu ở trên, vấn đề chung của việc tự động tìm kiếm bộ nhớ nào "không còn cần thiết nữa" là không thể quyết định. Do đó, các garbage collector triển khai một giải pháp hạn chế cho vấn đề chung. Phần này sẽ giải thích các khái niệm cần thiết để hiểu các thuật toán garbage collection chính và các giới hạn tương ứng của chúng.

### Tham chiếu

Khái niệm chính mà các thuật toán garbage collection dựa vào là khái niệm _tham chiếu_. Trong ngữ cảnh quản lý bộ nhớ, một đối tượng được cho là tham chiếu đến đối tượng khác nếu đối tượng trước có quyền truy cập vào đối tượng sau (dù là ngầm định hay tường minh). Ví dụ, một đối tượng JavaScript có tham chiếu đến [prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của nó (tham chiếu ngầm định) và các giá trị thuộc tính của nó (tham chiếu tường minh).

Trong ngữ cảnh này, khái niệm "đối tượng" được mở rộng thành thứ gì đó rộng hơn các đối tượng JavaScript thông thường và cũng bao gồm các phạm vi hàm (hoặc phạm vi lexical toàn cục).

### Garbage collection đếm tham chiếu

> [!NOTE]
> Không có engine JavaScript hiện đại nào còn sử dụng reference-counting cho garbage collection nữa.

Đây là thuật toán garbage collection đơn giản nhất. Thuật toán này rút gọn vấn đề từ việc xác định liệu một đối tượng có còn cần thiết hay không thành việc xác định liệu một đối tượng có còn bất kỳ đối tượng nào khác tham chiếu đến nó không. Một đối tượng được gọi là "rác" hay có thể thu gom nếu không có tham chiếu nào trỏ đến nó.

Ví dụ:

```js
let x = {
  a: {
    b: 2,
  },
};
// 2 objects are created. One is referenced by the other as one of its properties.
// The other is referenced by virtue of being assigned to the 'x' variable.
// Obviously, none can be garbage-collected.

let y = x;
// The 'y' variable is the second thing that has a reference to the object.

x = 1;
// Now, the object that was originally in 'x' has a unique reference
// embodied by the 'y' variable.

let z = y.a;
// Reference to 'a' property of the object.
// This object now has 2 references: one as a property,
// the other as the 'z' variable.

y = "mozilla";
// The object that was originally in 'x' has now zero
// references to it. It can be garbage-collected.
// However its 'a' property is still referenced by
// the 'z' variable, so it cannot be freed.

z = null;
// The 'a' property of the object originally in x
// has zero references to it. It can be garbage collected.
```

Có một hạn chế khi gặp các tham chiếu vòng. Trong ví dụ sau, hai đối tượng được tạo ra với các thuộc tính tham chiếu lẫn nhau, tạo thành một chu kỳ. Chúng sẽ ra khỏi phạm vi sau khi lời gọi hàm hoàn thành. Tại thời điểm đó, chúng trở nên không cần thiết và bộ nhớ đã cấp phát của chúng cần được thu hồi. Tuy nhiên, thuật toán đếm tham chiếu sẽ không coi chúng là có thể thu hồi vì mỗi trong hai đối tượng có ít nhất một tham chiếu trỏ đến chúng, dẫn đến không có đối tượng nào được đánh dấu để thu gom rác. Tham chiếu vòng là nguyên nhân phổ biến của memory leak.

```js
function f() {
  const x = {};
  const y = {};
  x.a = y; // x references y
  y.a = x; // y references x

  return "azerty";
}

f();
```

### Thuật toán mark-and-sweep

Thuật toán này rút gọn định nghĩa "một đối tượng không còn cần thiết" thành "một đối tượng không thể tiếp cận".

Thuật toán này giả định có kiến thức về một tập hợp các đối tượng được gọi là _roots_. Trong JavaScript, root là đối tượng toàn cục. Định kỳ, garbage collector sẽ bắt đầu từ các roots này, tìm tất cả các đối tượng được tham chiếu từ các roots này, sau đó tất cả các đối tượng được tham chiếu từ những đối tượng đó, v.v. Bắt đầu từ các roots, garbage collector do đó sẽ tìm tất cả các đối tượng _có thể tiếp cận_ và thu gom tất cả các đối tượng _không thể tiếp cận_.

Thuật toán này là một cải tiến so với thuật toán trước vì một đối tượng có số tham chiếu bằng không thực sự không thể tiếp cận. Điều ngược lại không đúng như chúng ta đã thấy với tham chiếu vòng.

Hiện nay, tất cả các engine hiện đại đều tích hợp một garbage collector mark-and-sweep. Tất cả các cải tiến được thực hiện trong lĩnh vực garbage collection JavaScript (generational/incremental/concurrent/parallel garbage collection) trong vài năm qua đều là các cải tiến triển khai của thuật toán này, nhưng không phải là cải tiến cho bản thân thuật toán garbage collection hay việc thu gọn định nghĩa khi nào "một đối tượng không còn cần thiết".

Lợi ích ngay lập tức của cách tiếp cận này là các chu kỳ không còn là vấn đề. Trong ví dụ đầu tiên ở trên, sau khi lời gọi hàm trả về, hai đối tượng không còn được tham chiếu bởi bất kỳ tài nguyên nào có thể tiếp cận từ đối tượng toàn cục. Do đó, chúng sẽ được garbage collector tìm thấy là không thể tiếp cận và bộ nhớ đã cấp phát sẽ được thu hồi.

Tuy nhiên, việc không thể kiểm soát thủ công garbage collection vẫn còn tồn tại. Đôi khi sẽ tiện lợi hơn khi có thể tự quyết định khi nào và bộ nhớ nào được giải phóng. Để giải phóng bộ nhớ của một đối tượng, nó cần được làm tường minh là không thể tiếp cận. Cũng không thể kích hoạt garbage collection theo chương trình trong JavaScript — và có thể sẽ không bao giờ nằm trong ngôn ngữ lõi, mặc dù các engine có thể cung cấp các API đằng sau các flag tùy chọn.

## Cấu hình mô hình bộ nhớ của engine

Các JavaScript engine thường cung cấp các flag để hiển thị mô hình bộ nhớ. Ví dụ, Node.js cung cấp các tùy chọn và công cụ bổ sung để hiển thị các cơ chế V8 cơ bản để cấu hình và gỡ lỗi các vấn đề bộ nhớ. Cấu hình này có thể không có sẵn trong trình duyệt, và càng ít hơn đối với các trang web (thông qua HTTP headers, v.v.).

Lượng bộ nhớ heap tối đa có sẵn có thể được tăng bằng một flag:

```bash
node --max-old-space-size=6000 index.js
```

Chúng ta cũng có thể hiển thị garbage collector để gỡ lỗi các vấn đề bộ nhớ bằng cách sử dụng flag và [Chrome Debugger](https://nodejs.org/en/learn/getting-started/debugging):

```bash
node --expose-gc --inspect index.js
```

## Các cấu trúc dữ liệu hỗ trợ quản lý bộ nhớ

Mặc dù JavaScript không trực tiếp hiển thị API garbage collector, ngôn ngữ cung cấp một số cấu trúc dữ liệu gián tiếp quan sát garbage collection và có thể được sử dụng để quản lý mức sử dụng bộ nhớ.

### WeakMaps và WeakSets

[`WeakMap`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakMap) và [`WeakSet`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakSet) là các cấu trúc dữ liệu có API phản ánh chặt chẽ các đối tác không-weak của chúng: [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) và [`Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set). `WeakMap` cho phép bạn duy trì một tập hợp các cặp key-value, trong khi `WeakSet` cho phép bạn duy trì một tập hợp các giá trị duy nhất, cả hai đều có thêm, xóa và truy vấn hiệu quả.

`WeakMap` và `WeakSet` có tên từ khái niệm _giá trị được giữ yếu_. Nếu `x` được giữ yếu bởi `y`, điều đó có nghĩa là mặc dù bạn có thể truy cập giá trị của `x` thông qua `y`, thuật toán mark-and-sweep sẽ không coi `x` là có thể tiếp cận nếu không có gì khác _giữ mạnh_ nó. Hầu hết các cấu trúc dữ liệu, ngoại trừ những cái được thảo luận ở đây, giữ mạnh các đối tượng được truyền vào để bạn có thể lấy chúng bất cứ lúc nào. Các khóa của `WeakMap` và `WeakSet` có thể bị thu gom rác (đối với các đối tượng `WeakMap`, các giá trị sau đó cũng đủ điều kiện để thu gom rác) miễn là không có gì khác trong chương trình đang tham chiếu đến khóa. Điều này được đảm bảo bởi hai đặc điểm:

- `WeakMap` và `WeakSet` chỉ có thể lưu trữ các đối tượng hoặc symbol. Điều này vì chỉ có các đối tượng mới bị thu gom rác — các giá trị nguyên thủy luôn có thể được giả mạo (tức là `1 === 1` nhưng `{} !== {}`), khiến chúng ở lại trong tập hợp mãi mãi. [Registered symbols](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) (như `Symbol.for("key")`) cũng có thể được giả mạo và do đó không thể thu gom rác, nhưng các symbol được tạo bằng `Symbol("key")` có thể thu gom rác. [Well-known symbols](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) như `Symbol.iterator` thuộc một tập hợp cố định và là duy nhất trong suốt vòng đời của chương trình, tương tự các đối tượng nội tại như `Array.prototype`, vì vậy chúng cũng được phép làm khóa.
- `WeakMap` và `WeakSet` không có thể lặp. Điều này ngăn bạn sử dụng `Array.from(map.keys()).length` để quan sát sự sống còn của các đối tượng, hoặc lấy một khóa tùy ý mà lẽ ra đủ điều kiện để thu gom rác. (Garbage collection nên được ẩn đi càng nhiều càng tốt.)

Trong các giải thích thông thường về `WeakMap` và `WeakSet` (như ở trên), thường ngụ ý rằng khóa bị thu gom rác trước, giải phóng giá trị cũng bị thu gom. Tuy nhiên, hãy xem xét trường hợp giá trị tham chiếu đến khóa:

```js
const wm = new WeakMap();
const key = {};
wm.set(key, { key });
// Now `key` cannot be garbage collected,
// because the value holds a reference to the key,
// and the value is strongly held in the map!
```

Nếu `key` được lưu trữ như một tham chiếu thực tế, nó sẽ tạo ra một tham chiếu vòng và khiến cả khóa lẫn giá trị đều không đủ điều kiện để thu gom rác, ngay cả khi không có gì khác tham chiếu đến `key` — bởi vì nếu `key` bị thu gom rác, điều đó có nghĩa là tại một thời điểm cụ thể nào đó, `value.key` sẽ trỏ đến một địa chỉ không tồn tại, điều này không hợp lệ. Để khắc phục điều này, các mục nhập của `WeakMap` và `WeakSet` không phải là các tham chiếu thực tế, mà là [ephemerons](https://dl.acm.org/doi/pdf/10.1145/263700.263733), một cải tiến của cơ chế mark-and-sweep. [Barros et al.](https://www.jucs.org/jucs_14_21/eliminating_cycles_in_weak/jucs_14_21_3481_3497_barros.pdf) cung cấp một tóm tắt tốt về thuật toán (trang 4). Để trích dẫn một đoạn:

> Ephemerons là sự tinh chỉnh của các cặp yếu mà trong đó cả khóa lẫn giá trị đều không thể được phân loại là yếu hay mạnh. Khả năng kết nối của khóa xác định khả năng kết nối của giá trị, nhưng khả năng kết nối của giá trị không ảnh hưởng đến khả năng kết nối của khóa. [...] khi garbage collection hỗ trợ ephemerons, nó xảy ra trong ba giai đoạn thay vì hai (mark và sweep).

Như một mô hình tinh thần thô, hãy nghĩ về `WeakMap` như triển khai sau:

> [!WARNING]
> Đây không phải là polyfill, cũng không gần với cách nó được triển khai trong engine (cái móc vào cơ chế garbage collection).

```js
class MyWeakMap {
  #marker = Symbol("MyWeakMapData");
  get(key) {
    return key[this.#marker];
  }
  set(key, value) {
    key[this.#marker] = value;
  }
  has(key) {
    return this.#marker in key;
  }
  delete(key) {
    delete key[this.#marker];
  }
}
```

Như bạn có thể thấy, `MyWeakMap` không thực sự giữ một tập hợp các khóa. Nó chỉ đơn giản là thêm metadata vào mỗi đối tượng được truyền vào. Đối tượng sau đó có thể bị thu gom rác thông qua mark-and-sweep. Do đó, không thể lặp qua các khóa trong một `WeakMap`, cũng không thể xóa `WeakMap` (vì điều đó cũng dựa vào việc biết toàn bộ tập hợp khóa).

Để biết thêm thông tin về API của chúng, hãy xem hướng dẫn [keyed collections](/en-US/docs/Web/JavaScript/Guide/Keyed_collections).

### WeakRefs và FinalizationRegistry

> [!NOTE]
> `WeakRef` và `FinalizationRegistry` cung cấp khả năng quan sát trực tiếp vào cơ chế garbage collection. [Tránh sử dụng chúng khi có thể](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#avoid_where_possible) vì ngữ nghĩa runtime gần như hoàn toàn không được đảm bảo.

Tất cả các biến có giá trị là đối tượng đều là các tham chiếu đến đối tượng đó. Tuy nhiên, các tham chiếu như vậy là _mạnh_ — sự tồn tại của chúng sẽ ngăn garbage collector đánh dấu đối tượng là đủ điều kiện để thu gom. Một [`WeakRef`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef) là một _tham chiếu yếu_ đến một đối tượng cho phép đối tượng bị thu gom rác, trong khi vẫn giữ khả năng đọc nội dung của đối tượng trong suốt vòng đời của nó.

Một trường hợp sử dụng cho `WeakRef` là hệ thống bộ đệm ánh xạ chuỗi URL đến các đối tượng lớn. Chúng ta không thể dùng `WeakMap` cho mục đích này, vì các đối tượng `WeakMap` có _khóa_ được giữ yếu, nhưng không phải _giá trị_ — nếu bạn truy cập một khóa, bạn sẽ luôn nhận được giá trị một cách xác định (vì có quyền truy cập vào khóa có nghĩa là nó vẫn còn sống). Ở đây, chúng ta không sao nếu nhận được `undefined` cho một khóa (nếu giá trị tương ứng không còn sống) vì chúng ta có thể tính toán lại nó, nhưng chúng ta không muốn các đối tượng không thể tiếp cận ở lại trong bộ đệm. Trong trường hợp này, chúng ta có thể dùng `Map` thông thường, nhưng với mỗi giá trị là một `WeakRef` của đối tượng thay vì giá trị đối tượng thực tế.

```js
function cached(getter) {
  // A Map from string URLs to WeakRefs of results
  const cache = new Map();
  return async (key) => {
    if (cache.has(key)) {
      const dereferencedValue = cache.get(key).deref();
      if (dereferencedValue !== undefined) {
        return dereferencedValue;
      }
    }
    const value = await getter(key);
    cache.set(key, new WeakRef(value));
    return value;
  };
}

const getImage = cached((url) => fetch(url).then((res) => res.blob()));
```

[`FinalizationRegistry`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry) cung cấp một cơ chế mạnh hơn để quan sát garbage collection. Nó cho phép bạn đăng ký các đối tượng và được thông báo khi chúng bị thu gom rác. Ví dụ, đối với hệ thống bộ đệm được minh họa ở trên, ngay cả khi các blob tự chúng có thể được thu gom, các đối tượng `WeakRef` giữ chúng thì không — và theo thời gian, `Map` có thể tích lũy nhiều mục nhập vô dụng. Sử dụng `FinalizationRegistry` cho phép thực hiện dọn dẹp trong trường hợp này.

```js
function cached(getter) {
  // A Map from string URLs to WeakRefs of results
  const cache = new Map();
  // Every time after a value is garbage collected, the callback is
  // called with the key in the cache as argument, allowing us to remove
  // the cache entry
  const registry = new FinalizationRegistry((key) => {
    // Note: it's important to test that the WeakRef is indeed empty.
    // Otherwise, the callback may be called after a new object has been
    // added with this key, and that new, alive object gets deleted
    if (!cache.get(key)?.deref()) {
      cache.delete(key);
    }
  });
  return async (key) => {
    if (cache.has(key)) {
      return cache.get(key).deref();
    }
    const value = await getter(key);
    cache.set(key, new WeakRef(value));
    registry.register(value, key);
    return value;
  };
}

const getImage = cached((url) => fetch(url).then((res) => res.blob()));
```

Do lo ngại về hiệu suất và bảo mật, không có gì đảm bảo khi nào callback sẽ được gọi, hoặc liệu nó có được gọi hay không. Nó chỉ nên được sử dụng để dọn dẹp — và dọn dẹp không quan trọng. Có những cách khác để quản lý tài nguyên xác định hơn, như [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch), luôn thực thi khối `finally`. `WeakRef` và `FinalizationRegistry` tồn tại hoàn toàn để tối ưu hóa việc sử dụng bộ nhớ trong các chương trình chạy dài.

Để biết thêm thông tin về API của [`WeakRef`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef) và [`FinalizationRegistry`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/FinalizationRegistry), hãy xem các trang tham khảo của chúng.
