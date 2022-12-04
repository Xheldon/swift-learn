//
//  PropertyWrapper.swift
//  swift-learn
//
//  Created by Xheldon on 28/11/2022.
//

// swift 中的属性包装器，在 js 中就是复杂点就是装饰器

@propertyWrapper
struct Wrapper {
    var value: Int = 0
    
    // 主注意这个 wrappedValue 是固定的名字，跟 @propertyWrapper 配套使用
    var wrappedValue: Int {
        get {
            return self.value
        }
        set {
            if newValue < 0 {
                self.value = 0
            } else if newValue > 255 {
                self.value = 255
            } else {
                self.value = newValue
            }
        }
    }
    // 还得给个初始化该 struct 时候传入的初始值
    init(wrappedValue initValue: Int) {
        self.value = initValue
    }
    // 下面的这个写法调用 MyColor 的时候会报错说传值不是 Wrapper 类型，wrappedValue 作为被装饰的内部值放到 init 第一个位置是固定写法？
//    init(value: Int) {
//        self.value = value
//    }
}


struct MyColor {
    @Wrapper var red: Int
    @Wrapper var green: Int
    @Wrapper var blue: Int
}

let color: MyColor = MyColor(red: 50, green: 50, blue: 50)
//let color: MyColor = MyColor(50, 50, 50)

