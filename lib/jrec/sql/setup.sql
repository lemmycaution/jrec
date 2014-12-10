-- Extensions

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "plv8";

-- PLV8 Functions
CREATE OR REPLACE FUNCTION plv8_startup() RETURNS void AS $$

  (function(){
    
  (function(){var root=this;var previousUnderscore=root._;var ArrayProto=Array.prototype,ObjProto=Object.prototype,FuncProto=Function.prototype;var push=ArrayProto.push,slice=ArrayProto.slice,concat=ArrayProto.concat,toString=ObjProto.toString,hasOwnProperty=ObjProto.hasOwnProperty;var nativeIsArray=Array.isArray,nativeKeys=Object.keys,nativeBind=FuncProto.bind;var _=function(obj){if(obj instanceof _)return obj;if(!(this instanceof _))return new _(obj);this._wrapped=obj};if(typeof exports!=='undefined'){if(typeof module!=='undefined'&&module.exports){exports=module.exports=_}exports._=_}else{root._=_}_.VERSION='1.7.0';var createCallback=function(func,context,argCount){if(context===void 0)return func;switch(argCount==null?3:argCount){case 1:return function(value){return func.call(context,value)};case 2:return function(value,other){return func.call(context,value,other)};case 3:return function(value,index,collection){return func.call(context,value,index,collection)};case 4:return function(accumulator,value,index,collection){return func.call(context,accumulator,value,index,collection)}}return function(){return func.apply(context,arguments)}};_.iteratee=function(value,context,argCount){if(value==null)return _.identity;if(_.isFunction(value))return createCallback(value,context,argCount);if(_.isObject(value))return _.matches(value);return _.property(value)};_.each=_.forEach=function(obj,iteratee,context){if(obj==null)return obj;iteratee=createCallback(iteratee,context);var i,length=obj.length;if(length===+length){for(i=0;i<length;i++){iteratee(obj[i],i,obj)}}else{var keys=_.keys(obj);for(i=0,length=keys.length;i<length;i++){iteratee(obj[keys[i]],keys[i],obj)}}return obj};_.map=_.collect=function(obj,iteratee,context){if(obj==null)return[];iteratee=_.iteratee(iteratee,context);var keys=obj.length!==+obj.length&&_.keys(obj),length=(keys||obj).length,results=Array(length),currentKey;for(var index=0;index<length;index++){currentKey=keys?keys[index]:index;results[index]=iteratee(obj[currentKey],currentKey,obj)}return results};var reduceError='Reduce of empty array with no initial value';_.reduce=_.foldl=_.inject=function(obj,iteratee,memo,context){if(obj==null)obj=[];iteratee=createCallback(iteratee,context,4);var keys=obj.length!==+obj.length&&_.keys(obj),length=(keys||obj).length,index=0,currentKey;if(arguments.length<3){if(!length)throw new TypeError(reduceError);memo=obj[keys?keys[index++]:index++]}for(;index<length;index++){currentKey=keys?keys[index]:index;memo=iteratee(memo,obj[currentKey],currentKey,obj)}return memo};_.reduceRight=_.foldr=function(obj,iteratee,memo,context){if(obj==null)obj=[];iteratee=createCallback(iteratee,context,4);var keys=obj.length!==+obj.length&&_.keys(obj),index=(keys||obj).length,currentKey;if(arguments.length<3){if(!index)throw new TypeError(reduceError);memo=obj[keys?keys[--index]:--index]}while(index--){currentKey=keys?keys[index]:index;memo=iteratee(memo,obj[currentKey],currentKey,obj)}return memo};_.find=_.detect=function(obj,predicate,context){var result;predicate=_.iteratee(predicate,context);_.some(obj,function(value,index,list){if(predicate(value,index,list)){result=value;return true}});return result};_.filter=_.select=function(obj,predicate,context){var results=[];if(obj==null)return results;predicate=_.iteratee(predicate,context);_.each(obj,function(value,index,list){if(predicate(value,index,list))results.push(value)});return results};_.reject=function(obj,predicate,context){return _.filter(obj,_.negate(_.iteratee(predicate)),context)};_.every=_.all=function(obj,predicate,context){if(obj==null)return true;predicate=_.iteratee(predicate,context);var keys=obj.length!==+obj.length&&_.keys(obj),length=(keys||obj).length,index,currentKey;for(index=0;index<length;index++){currentKey=keys?keys[index]:index;if(!predicate(obj[currentKey],currentKey,obj))return false}return true};_.some=_.any=function(obj,predicate,context){if(obj==null)return false;predicate=_.iteratee(predicate,context);var keys=obj.length!==+obj.length&&_.keys(obj),length=(keys||obj).length,index,currentKey;for(index=0;index<length;index++){currentKey=keys?keys[index]:index;if(predicate(obj[currentKey],currentKey,obj))return true}return false};_.contains=_.include=function(obj,target){if(obj==null)return false;if(obj.length!==+obj.length)obj=_.values(obj);return _.indexOf(obj,target)>=0};_.invoke=function(obj,method){var args=slice.call(arguments,2);var isFunc=_.isFunction(method);return _.map(obj,function(value){return(isFunc?method:value[method]).apply(value,args)})};_.pluck=function(obj,key){return _.map(obj,_.property(key))};_.where=function(obj,attrs){return _.filter(obj,_.matches(attrs))};_.findWhere=function(obj,attrs){return _.find(obj,_.matches(attrs))};_.max=function(obj,iteratee,context){var result=-Infinity,lastComputed=-Infinity,value,computed;if(iteratee==null&&obj!=null){obj=obj.length===+obj.length?obj:_.values(obj);for(var i=0,length=obj.length;i<length;i++){value=obj[i];if(value>result){result=value}}}else{iteratee=_.iteratee(iteratee,context);_.each(obj,function(value,index,list){computed=iteratee(value,index,list);if(computed>lastComputed||computed===-Infinity&&result===-Infinity){result=value;lastComputed=computed}})}return result};_.min=function(obj,iteratee,context){var result=Infinity,lastComputed=Infinity,value,computed;if(iteratee==null&&obj!=null){obj=obj.length===+obj.length?obj:_.values(obj);for(var i=0,length=obj.length;i<length;i++){value=obj[i];if(value<result){result=value}}}else{iteratee=_.iteratee(iteratee,context);_.each(obj,function(value,index,list){computed=iteratee(value,index,list);if(computed<lastComputed||computed===Infinity&&result===Infinity){result=value;lastComputed=computed}})}return result};_.shuffle=function(obj){var set=obj&&obj.length===+obj.length?obj:_.values(obj);var length=set.length;var shuffled=Array(length);for(var index=0,rand;index<length;index++){rand=_.random(0,index);if(rand!==index)shuffled[index]=shuffled[rand];shuffled[rand]=set[index]}return shuffled};_.sample=function(obj,n,guard){if(n==null||guard){if(obj.length!==+obj.length)obj=_.values(obj);return obj[_.random(obj.length-1)]}return _.shuffle(obj).slice(0,Math.max(0,n))};_.sortBy=function(obj,iteratee,context){iteratee=_.iteratee(iteratee,context);return _.pluck(_.map(obj,function(value,index,list){return{value:value,index:index,criteria:iteratee(value,index,list)}}).sort(function(left,right){var a=left.criteria;var b=right.criteria;if(a!==b){if(a>b||a===void 0)return 1;if(a<b||b===void 0)return-1}return left.index-right.index}),'value')};var group=function(behavior){return function(obj,iteratee,context){var result={};iteratee=_.iteratee(iteratee,context);_.each(obj,function(value,index){var key=iteratee(value,index,obj);behavior(result,value,key)});return result}};_.groupBy=group(function(result,value,key){if(_.has(result,key))result[key].push(value);else result[key]=[value]});_.indexBy=group(function(result,value,key){result[key]=value});_.countBy=group(function(result,value,key){if(_.has(result,key))result[key]++;else result[key]=1});_.sortedIndex=function(array,obj,iteratee,context){iteratee=_.iteratee(iteratee,context,1);var value=iteratee(obj);var low=0,high=array.length;while(low<high){var mid=low+high>>>1;if(iteratee(array[mid])<value)low=mid+1;else high=mid}return low};_.toArray=function(obj){if(!obj)return[];if(_.isArray(obj))return slice.call(obj);if(obj.length===+obj.length)return _.map(obj,_.identity);return _.values(obj)};_.size=function(obj){if(obj==null)return 0;return obj.length===+obj.length?obj.length:_.keys(obj).length};_.partition=function(obj,predicate,context){predicate=_.iteratee(predicate,context);var pass=[],fail=[];_.each(obj,function(value,key,obj){(predicate(value,key,obj)?pass:fail).push(value)});return[pass,fail]};_.first=_.head=_.take=function(array,n,guard){if(array==null)return void 0;if(n==null||guard)return array[0];return _.initial(array,array.length-n)};_.initial=function(array,n,guard){return slice.call(array,0,Math.max(0,array.length-(n==null||guard?1:n)))};_.last=function(array,n,guard){if(array==null)return void 0;if(n==null||guard)return array[array.length-1];return _.rest(array,Math.max(0,array.length-n))};_.rest=_.tail=_.drop=function(array,n,guard){return slice.call(array,n==null||guard?1:n)};_.compact=function(array){return _.filter(array,_.identity)};var flatten=function(input,shallow,strict,output){if(shallow&&_.every(input,_.isArray)){return concat.apply(output,input)}for(var i=0,length=input.length;i<length;i++){var value=input[i];if(!_.isArray(value)&&!_.isArguments(value)){if(!strict)output.push(value)}else if(shallow){push.apply(output,value)}else{flatten(value,shallow,strict,output)}}return output};_.flatten=function(array,shallow){return flatten(array,shallow,false,[])};_.without=function(array){return _.difference(array,slice.call(arguments,1))};_.uniq=_.unique=function(array,isSorted,iteratee,context){if(array==null)return[];if(!_.isBoolean(isSorted)){context=iteratee;iteratee=isSorted;isSorted=false}if(iteratee!=null)iteratee=_.iteratee(iteratee,context);var result=[];var seen=[];for(var i=0,length=array.length;i<length;i++){var value=array[i];if(isSorted){if(!i||seen!==value)result.push(value);seen=value}else if(iteratee){var computed=iteratee(value,i,array);if(_.indexOf(seen,computed)<0){seen.push(computed);result.push(value)}}else if(_.indexOf(result,value)<0){result.push(value)}}return result};_.union=function(){return _.uniq(flatten(arguments,true,true,[]))};_.intersection=function(array){if(array==null)return[];var result=[];var argsLength=arguments.length;for(var i=0,length=array.length;i<length;i++){var item=array[i];if(_.contains(result,item))continue;for(var j=1;j<argsLength;j++){if(!_.contains(arguments[j],item))break}if(j===argsLength)result.push(item)}return result};_.difference=function(array){var rest=flatten(slice.call(arguments,1),true,true,[]);return _.filter(array,function(value){return!_.contains(rest,value)})};_.zip=function(array){if(array==null)return[];var length=_.max(arguments,'length').length;var results=Array(length);while(length-->0){results[length]=_.pluck(arguments,length)}return results};_.unzip=function(array){return _.zip.apply(null,array)};_.object=function(list,values){if(list==null)return{};var result={};for(var i=0,length=list.length;i<length;i++){if(values){result[list[i]]=values[i]}else{result[list[i][0]]=list[i][1]}}return result};_.indexOf=function(array,item,isSorted){if(array==null)return-1;var i=0,length=array.length;if(isSorted){if(typeof isSorted=='number'){i=isSorted<0?Math.max(0,length+isSorted):isSorted}else{i=_.sortedIndex(array,item);return array[i]===item?i:-1}}for(;i<length;i++)if(array[i]===item)return i;return-1};_.lastIndexOf=function(array,item,from){if(array==null)return-1;var idx=array.length;if(typeof from=='number'){idx=from<0?idx+from+1:Math.min(idx,from+1)}while(--idx>=0)if(array[idx]===item)return idx;return-1};_.range=function(start,stop,step){if(arguments.length<=1){stop=start||0;start=0}step=step||1;var length=Math.max(Math.ceil((stop-start)/step),0);var range=Array(length);for(var idx=0;idx<length;idx++,start+=step){range[idx]=start}return range};var Ctor=function(){};_.bind=function(func,context){var args,bound;if(nativeBind&&func.bind===nativeBind)return nativeBind.apply(func,slice.call(arguments,1));if(!_.isFunction(func))throw new TypeError('Bind must be called on a function');args=slice.call(arguments,2);bound=function(){if(!(this instanceof bound))return func.apply(context,args.concat(slice.call(arguments)));Ctor.prototype=func.prototype;var self=new Ctor;Ctor.prototype=null;var result=func.apply(self,args.concat(slice.call(arguments)));if(_.isObject(result))return result;return self};return bound};_.partial=function(func){var boundArgs=slice.call(arguments,1);return function(){var position=0;var args=boundArgs.slice();for(var i=0,length=args.length;i<length;i++){if(args[i]===_)args[i]=arguments[position++]}while(position<arguments.length)args.push(arguments[position++]);return func.apply(this,args)}};_.bindAll=function(obj){var i,length=arguments.length,key;if(length<=1)throw new Error('bindAll must be passed function names');for(i=1;i<length;i++){key=arguments[i];obj[key]=_.bind(obj[key],obj)}return obj};_.memoize=function(func,hasher){var memoize=function(key){var cache=memoize.cache;var address=''+(hasher?hasher.apply(this,arguments):key);if(!_.has(cache,address))cache[address]=func.apply(this,arguments);return cache[address]};memoize.cache={};return memoize};_.delay=function(func,wait){var args=slice.call(arguments,2);return setTimeout(function(){return func.apply(null,args)},wait)};_.defer=function(func){return _.delay.apply(_,[func,1].concat(slice.call(arguments,1)))};_.throttle=function(func,wait,options){var context,args,result;var timeout=null;var previous=0;if(!options)options={};var later=function(){previous=options.leading===false?0:_.now();timeout=null;result=func.apply(context,args);if(!timeout)context=args=null};return function(){var now=_.now();if(!previous&&options.leading===false)previous=now;var remaining=wait-(now-previous);context=this;args=arguments;if(remaining<=0||remaining>wait){if(timeout){clearTimeout(timeout);timeout=null}previous=now;result=func.apply(context,args);if(!timeout)context=args=null}else if(!timeout&&options.trailing!==false){timeout=setTimeout(later,remaining)}return result}};_.debounce=function(func,wait,immediate){var timeout,args,context,timestamp,result;var later=function(){var last=_.now()-timestamp;if(last<wait&&last>=0){timeout=setTimeout(later,wait-last)}else{timeout=null;if(!immediate){result=func.apply(context,args);if(!timeout)context=args=null}}};return function(){context=this;args=arguments;timestamp=_.now();var callNow=immediate&&!timeout;if(!timeout)timeout=setTimeout(later,wait);if(callNow){result=func.apply(context,args);context=args=null}return result}};_.wrap=function(func,wrapper){return _.partial(wrapper,func)};_.negate=function(predicate){return function(){return!predicate.apply(this,arguments)}};_.compose=function(){var args=arguments;var start=args.length-1;return function(){var i=start;var result=args[start].apply(this,arguments);while(i--)result=args[i].call(this,result);return result}};_.after=function(times,func){return function(){if(--times<1){return func.apply(this,arguments)}}};_.before=function(times,func){var memo;return function(){if(--times>0){memo=func.apply(this,arguments)}else{func=null}return memo}};_.once=_.partial(_.before,2);var hasEnumBug=!({toString:null}).propertyIsEnumerable('toString');var nonEnumerableProps=['constructor','valueOf','isPrototypeOf','toString','propertyIsEnumerable','hasOwnProperty','toLocaleString'];_.keys=function(obj){if(!_.isObject(obj))return[];if(nativeKeys)return nativeKeys(obj);var keys=[];for(var key in obj)if(_.has(obj,key))keys.push(key);if(hasEnumBug){var nonEnumIdx=nonEnumerableProps.length;while(nonEnumIdx--){var prop=nonEnumerableProps[nonEnumIdx];if(_.has(obj,prop)&&!_.contains(keys,prop))keys.push(prop)}}return keys};_.values=function(obj){var keys=_.keys(obj);var length=keys.length;var values=Array(length);for(var i=0;i<length;i++){values[i]=obj[keys[i]]}return values};_.pairs=function(obj){var keys=_.keys(obj);var length=keys.length;var pairs=Array(length);for(var i=0;i<length;i++){pairs[i]=[keys[i],obj[keys[i]]]}return pairs};_.invert=function(obj){var result={};var keys=_.keys(obj);for(var i=0,length=keys.length;i<length;i++){result[obj[keys[i]]]=keys[i]}return result};_.functions=_.methods=function(obj){var names=[];for(var key in obj){if(_.isFunction(obj[key]))names.push(key)}return names.sort()};_.extend=function(obj){if(!_.isObject(obj))return obj;var source,prop;for(var i=1,length=arguments.length;i<length;i++){source=arguments[i];for(prop in source){obj[prop]=source[prop]}}return obj};_.pick=function(obj,iteratee,context){var result={},key;if(obj==null)return result;if(_.isFunction(iteratee)){iteratee=createCallback(iteratee,context);for(key in obj){var value=obj[key];if(iteratee(value,key,obj))result[key]=value}}else{var keys=concat.apply([],slice.call(arguments,1));obj=new Object(obj);for(var i=0,length=keys.length;i<length;i++){key=keys[i];if(key in obj)result[key]=obj[key]}}return result};_.omit=function(obj,iteratee,context){if(_.isFunction(iteratee)){iteratee=_.negate(iteratee)}else{var keys=_.map(concat.apply([],slice.call(arguments,1)),String);iteratee=function(value,key){return!_.contains(keys,key)}}return _.pick(obj,iteratee,context)};_.defaults=function(obj){if(!_.isObject(obj))return obj;for(var i=1,length=arguments.length;i<length;i++){var source=arguments[i];for(var prop in source){if(obj[prop]===void 0)obj[prop]=source[prop]}}return obj};_.clone=function(obj){if(!_.isObject(obj))return obj;return _.isArray(obj)?obj.slice():_.extend({},obj)};_.tap=function(obj,interceptor){interceptor(obj);return obj};var eq=function(a,b,aStack,bStack){if(a===b)return a!==0||1/a===1/b;if(a==null||b==null)return a===b;if(a instanceof _)a=a._wrapped;if(b instanceof _)b=b._wrapped;var className=toString.call(a);if(className!==toString.call(b))return false;switch(className){case'[object RegExp]':case'[object String]':return''+a===''+b;case'[object Number]':if(+a!==+a)return+b!==+b;return+a===0?1/+a===1/b:+a===+b;case'[object Date]':case'[object Boolean]':return+a===+b}var areArrays=className==='[object Array]';if(!areArrays){if(typeof a!='object'||typeof b!='object')return false;var aCtor=a.constructor,bCtor=b.constructor;if(aCtor!==bCtor&&!(_.isFunction(aCtor)&&aCtor instanceof aCtor&&_.isFunction(bCtor)&&bCtor instanceof bCtor)&&('constructor'in a&&'constructor'in b)){return false}}var length=aStack.length;while(length--){if(aStack[length]===a)return bStack[length]===b}aStack.push(a);bStack.push(b);var size,result;if(areArrays){size=a.length;result=size===b.length;if(result){while(size--){if(!(result=eq(a[size],b[size],aStack,bStack)))break}}}else{var keys=_.keys(a),key;size=keys.length;result=_.keys(b).length===size;if(result){while(size--){key=keys[size];if(!(result=_.has(b,key)&&eq(a[key],b[key],aStack,bStack)))break}}}aStack.pop();bStack.pop();return result};_.isEqual=function(a,b){return eq(a,b,[],[])};_.isEmpty=function(obj){if(obj==null)return true;if(_.isArray(obj)||_.isString(obj)||_.isArguments(obj))return obj.length===0;for(var key in obj)if(_.has(obj,key))return false;return true};_.isElement=function(obj){return!!(obj&&obj.nodeType===1)};_.isArray=nativeIsArray||function(obj){return toString.call(obj)==='[object Array]'};_.isObject=function(obj){var type=typeof obj;return type==='function'||type==='object'&&!!obj};_.each(['Arguments','Function','String','Number','Date','RegExp','Error'],function(name){_['is'+name]=function(obj){return toString.call(obj)==='[object '+name+']'}});if(!_.isArguments(arguments)){_.isArguments=function(obj){return _.has(obj,'callee')}}if(typeof/./!=='function'){_.isFunction=function(obj){return typeof obj=='function'||false}}_.isFinite=function(obj){return isFinite(obj)&&!isNaN(parseFloat(obj))};_.isNaN=function(obj){return _.isNumber(obj)&&obj!==+obj};_.isBoolean=function(obj){return obj===true||obj===false||toString.call(obj)==='[object Boolean]'};_.isNull=function(obj){return obj===null};_.isUndefined=function(obj){return obj===void 0};_.has=function(obj,key){return obj!=null&&hasOwnProperty.call(obj,key)};_.noConflict=function(){root._=previousUnderscore;return this};_.identity=function(value){return value};_.constant=function(value){return function(){return value}};_.noop=function(){};_.property=function(key){return function(obj){return obj==null?void 0:obj[key]}};_.matches=function(attrs){var pairs=_.pairs(attrs),length=pairs.length;return function(obj){if(obj==null)return!length;obj=new Object(obj);for(var i=0;i<length;i++){var pair=pairs[i],key=pair[0];if(pair[1]!==obj[key]||!(key in obj))return false}return true}};_.times=function(n,iteratee,context){var accum=Array(Math.max(0,n));iteratee=createCallback(iteratee,context,1);for(var i=0;i<n;i++)accum[i]=iteratee(i);return accum};_.random=function(min,max){if(max==null){max=min;min=0}return min+Math.floor(Math.random()*(max-min+1))};_.now=Date.now||function(){return new Date().getTime()};var escapeMap={'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#x27;','`':'&#x60;'};var unescapeMap=_.invert(escapeMap);var createEscaper=function(map){var escaper=function(match){return map[match]};var source='(?:'+_.keys(map).join('|')+')';var testRegexp=RegExp(source);var replaceRegexp=RegExp(source,'g');return function(string){string=string==null?'':''+string;return testRegexp.test(string)?string.replace(replaceRegexp,escaper):string}};_.escape=createEscaper(escapeMap);_.unescape=createEscaper(unescapeMap);_.result=function(object,property,fallback){var value=object==null?void 0:object[property];if(value===void 0){return fallback}return _.isFunction(value)?object[property]():value};var idCounter=0;_.uniqueId=function(prefix){var id=++idCounter+'';return prefix?prefix+id:id};_.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var noMatch=/(.)^/;var escapes={"'":"'",'\\':'\\','\r':'r','\n':'n','\u2028':'u2028','\u2029':'u2029'};var escaper=/\\|'|\r|\n|\u2028|\u2029/g;var escapeChar=function(match){return'\\'+escapes[match]};_.template=function(text,settings,oldSettings){if(!settings&&oldSettings)settings=oldSettings;settings=_.defaults({},settings,_.templateSettings);var matcher=RegExp([(settings.escape||noMatch).source,(settings.interpolate||noMatch).source,(settings.evaluate||noMatch).source].join('|')+'|$','g');var index=0;var source="__p+='";text.replace(matcher,function(match,escape,interpolate,evaluate,offset){source+=text.slice(index,offset).replace(escaper,escapeChar);index=offset+match.length;if(escape){source+="'+\n((__t=("+escape+"))==null?'':_.escape(__t))+\n'"}else if(interpolate){source+="'+\n((__t=("+interpolate+"))==null?'':__t)+\n'"}else if(evaluate){source+="';\n"+evaluate+"\n__p+='"}return match});source+="';\n";if(!settings.variable)source='with(obj||{}){\n'+source+'}\n';source="var __t,__p='',__j=Array.prototype.join,"+"print=function(){__p+=__j.call(arguments,'');};\n"+source+'return __p;\n';try{var render=new Function(settings.variable||'obj','_',source)}catch(e){e.source=source;throw e}var template=function(data){return render.call(this,data,_)};var argument=settings.variable||'obj';template.source='function('+argument+'){\n'+source+'}';return template};_.chain=function(obj){var instance=_(obj);instance._chain=true;return instance};var result=function(instance,obj){return instance._chain?_(obj).chain():obj};_.mixin=function(obj){_.each(_.functions(obj),function(name){var func=_[name]=obj[name];_.prototype[name]=function(){var args=[this._wrapped];push.apply(args,arguments);return result(this,func.apply(_,args))}})};_.mixin(_);_.each(['pop','push','reverse','shift','sort','splice','unshift'],function(name){var method=ArrayProto[name];_.prototype[name]=function(){var obj=this._wrapped;method.apply(obj,arguments);if((name==='shift'||name==='splice')&&obj.length===0)delete obj[0];return result(this,obj)}});_.each(['concat','join','slice'],function(name){var method=ArrayProto[name];_.prototype[name]=function(){return result(this,method.apply(this._wrapped,arguments))}});_.prototype.value=function(){return this._wrapped};if(typeof define==='function'&&define.amd){define('underscore',[],function(){return _})}}.call(this));
  
  (function(){
    var 
      root=this,
      Jrec = (function() {
    function Jrec() {}
    
    var Builder = (function() {
      function Builder(schema_name, table_name, search_path, query) {
        var _base;
        this.schema_name = schema_name;
        this.table_name = table_name;
        this.search_path = search_path;
        this.query = query;
        if ((_base = this.query).select == null) {
          _base.select = "*";
        }
        this.params = [];
        this.i = 0;
      }

      Builder.prototype.qm = function() {
        return "$" + (this.i += 1);
      };

      Builder.prototype.make_distinct = function() {
        return _.map(this.query.distinct.split(","), function(f) {
          return "data->>'" + f + "' AS " + f;
        }).join(", ");
      };

      Builder.prototype.make_select = function() {
        if (this.query.select === "*") {
          return "data";
        } else if (_.isArray(this.query.select)) {
          this.params.push(this.query.select.join(","));
          return "jrec_select(data, " + (this.qm()) + ") as data";
        } else {
          return this.query.select;
        }
      };

      Builder.prototype.make_where = function(q, join_by) {
        var comparisons, k, sql, subquery, symbol, value, _i, _len;
        if (join_by == null) {
          join_by = 'AND';
        }
        sql = [];
        for (k in q) {
          subquery = q[k];
          switch (k) {
            case 'and':
            case 'AND':
            case '&':
            case '&&':
              sql.push("(" + (this.make_where(subquery, 'AND')) + ")");
              break;
            case 'or':
            case 'OR':
            case '|':
            case '||':
              sql.push("(" + (this.make_where(subquery, 'OR')) + ")");
              break;
            case 'not':
            case 'NOT':
            case '!':
              sql.push("NOT (" + (this.make_where(subquery, 'AND')) + ")");
              break;
            case 'raw':
              sql.push(subquery);
              break;
            default:
              if (_.isArray(subquery)) {
                this.params.push(k);
                this.params.push(subquery[1]);
                sql.push("" + (this.plv8_key(subquery[1])) + " " + subquery[0] + " " + (this.plv8_qm(subquery[1])));
              } else if (_.isObject(subquery)) {
                comparisons = [];
                for (value = _i = 0, _len = subquery.length; _i < _len; value = ++_i) {
                  symbol = subquery[value];
                  comparisons.push("" + symbol + " " + (this.plv8_qm(value)));
                  this.params.push(k);
                  this.params.push(value);
                }
                sql.push(_.map(comparisons, function(comparison) {
                  return "" + (this.plv8_key(value)) + " " + comparison;
                }).join(" AND "));
              } else {
                this.params.push(k);
                this.params.push(subquery);
                sql.push("" + (this.plv8_key(subquery)) + " = " + (this.plv8_qm(subquery)));
              }
          }
        }
        return sql.join("\n" + join_by + " ");
      };

      Builder.prototype.make_order_by = function() {
        var k, ord, str, v, _i, _len;
        str = [];
        ord = this.query.order_by;
        if (_.isArray(ord)) {
          this.params.push(ord[0]);
          str.push("" + (this.plv8_key(ord[1])) + " " + (ord[1].toUpperCase()));
        } else if (_.isObject(ord)) {
          for (v = _i = 0, _len = ord.length; _i < _len; v = ++_i) {
            k = ord[v];
            this.params.push(v);
            str.push("" + (this.plv8_key(k)) + " " + (k.toUpperCase()));
          }
        } else if (ord != null) {
          str.push(ord);
        }
        return str.join(",");
      };

      Builder.prototype.make_group_by = function() {
        var k, ord, str, v, _i, _len;
        str = [];
        ord = this.query.group_by;
        if (this.query.distinct) {
          str.push(_.map(this.query.distinct.split(","), function(f) {
            return "data->>'" + f + "'";
          }));
        }
        if (_.isArray(ord)) {
          this.params.push(ord[0]);
          str.push("" + (this.plv8_key(ord[1])) + " " + (ord[1].toUpperCase()));
        } else if (_.isObject(ord)) {
          for (v = _i = 0, _len = ord.length; _i < _len; v = ++_i) {
            k = ord[v];
            this.params.push(v);
            str.push("" + (this.plv8_key(k)) + " " + (k.toUpperCase()));
          }
        } else if (ord != null) {
          str.push(ord);
        }
        return _.flatten(str).join(",");
      };

      Builder.prototype.make_limit = function() {
        this.params.push(this.query.limit);
        return this.qm();
      };

      Builder.prototype.make_offset = function() {
        this.params.push(this.query.offset);
        return this.qm();
      };

      Builder.prototype.build_select = function() {
        var sql;
        sql = [];
        sql.push("SET search_path TO " + this.search_path + ";");
        sql.push("SELECT");
        if (this.query.distinct != null) {
          sql.push("DISTINCT " + (this.make_distinct()) + ",");
        }
        sql.push("" + (this.make_select()) + " FROM " + this.schema_name + "." + this.table_name);
        if (!_.isEmpty(this.query.where)) {
          sql.push("WHERE " + (this.make_where(this.query.where)));
        }
        if ((this.query.group_by != null) || (this.query.distinct != null)) {
          sql.push("GROUP BY " + (this.make_group_by()));
        }
        if (this.query.order_by != null) {
          sql.push("ORDER BY " + (this.make_order_by()));
        }
        if (this.query.limit != null) {
          sql.push("LIMIT " + (this.make_limit()));
        }
        if (this.query.offset != null) {
          sql.push("OFFSET " + (this.make_offset()));
        }
        return [sql.join("\n"), this.params];
      };

      Builder.prototype.build_delete = function() {
        var sql;
        sql = [];
        sql.push("SET search_path TO " + this.search_path + ";");
        sql.push("DELETE FROM " + this.schema_name + "." + this.table_name);
        if (!_.isEmpty(this.query.where)) {
          sql.push("WHERE " + (this.make_where(this.query.where)));
        }
        sql.push("RETURNING data::json;");
        return [sql.join("\n"), this.params];
      };

      Builder.prototype.build_update = function(data, merge) {
        var sql;
        if (merge == null) {
          merge = true;
        }
        this.params.push(data);
        this.params.push(merge);
        sql = [];
        sql.push("SET search_path TO " + this.search_path + ";");
        sql.push("UPDATE " + this.schema_name + "." + this.table_name + " SET data = jrec_patch(data," + (this.qm()) + "," + (this.qm()) + ")");
        if (!_.isEmpty(this.query.where)) {
          sql.push("WHERE " + (this.make_where(this.query.where)));
        }
        sql.push("RETURNING data::json;");
        return [sql.join("\n"), this.params];
      };

      Builder.prototype.build_insert = function(data, merge) {
        var sql;
        if (merge == null) {
          merge = true;
        }
        this.params.push(data);
        this.params.push(merge);
        sql = [];
        sql.push("SET search_path TO " + this.search_path + ";");
        sql.push("INSERT INTO " + this.schema_name + "." + this.table_name + " (data) VALUES (jrec_patch(jrec_defaults()," + (this.qm()) + "," + (this.qm()) + "))");
        sql.push("RETURNING data::json;");
        return [sql.join("\n"), this.params];
      };

      Builder.prototype.plv8_key = function(value) {
        return "" + (this.typecast(value, true)) + "(data, " + (this.qm()) + "::text)";
      };

      Builder.prototype.plv8_qm = function(value) {
        return "" + (this.qm()) + "::" + (this.typecast(value));
      };

      Builder.prototype.typecast = function(value, is_func) {
        var type;
        if (is_func == null) {
          is_func = false;
        }
        type = is_func ? "jrec_" : "";
        if (_.isBoolean(value)) {
          type += "bool";
        } else if (_.isDate(value)) {
          type += "timestamp";
        } else if (_.isNumber(value)) {
          type += "integer";
        } else if (_.isObject(value)) {
          type += (is_func ? "text" : "json");
        } else if (_.isArray(value)) {
          type += (is_func ? "text" : "array");
        } else {
          type += (is_func ? "string" : "text");
        }
        return type;
      };

      return Builder;

    })();    
    
    Jrec.prototype.json = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return JSON.stringify(ret);
    };

    Jrec.prototype.string = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return ret.toString();
    };

    Jrec.prototype.integer = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return parseInt(ret);
    };

    Jrec.prototype.integer_array = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return (ret instanceof Array ? ret : [ret]);
    };

    Jrec.prototype.float = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return parseFloat(ret);
    };

    Jrec.prototype.bool = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return !!ret;
    };

    Jrec.prototype.timestamp = function(_data, _key) {
      var ret;
      ret = valueAt(_data, _key);
      if (ret == null) {
        return null;
      }
      return new Date(ret);
    };

    Jrec.prototype.patch = function(_data, _value, _sync) {
      var changes, data, defaults, isObject, k, sync;
      data = _data;
      changes = _value;
      isObject = false;
      sync = _sync != null ? _sync : true;
      defaults = _.pick(data, _.keys(JSON.parse(this.defaults())));
      for (k in changes) {
        if (data.hasOwnProperty(k)) {
          isObject = typeof data[k] === "object" && typeof changes[k] === "object";
          data[k] = isObject && sync ? _.extend(data[k], changes[k]) : changes[k];
        } else {
          data[k] = changes[k];
        }
      }
      if (!sync) {
        for (k in data) {
          if (changes[k] == null) {
            delete data[k];
          }
        }
      }
      _.extend(data, defaults);
      return JSON.stringify(data);
    };

    Jrec.prototype.select = function(_data, _fields) {
      var data, fields, ret;
      data = _data;
      fields = _fields;
      ret = _.pick(data, fields.split(","));
      return JSON.stringify(ret);
    };

    Jrec.prototype.push = function(_data, _key, _value) {
      var data, field, i, keys, last_field, len, value;
      data = _data;
      value = _value;
      keys = _key.split(".");
      len = keys.length;
      last_field = data;
      field = data;
      i = 0;
      while (i < len) {
        last_field = field;
        if (field) {
          field = field[keys[i]];
        }
        ++i;
      }
      if (field) {
        field.push(value);
      } else {
        if (!(value instanceof Array)) {
          value = [value];
        }
        last_field[keys.pop()] = value;
      }
      return JSON.stringify(data);
    };

    Jrec.prototype.uuid = function() {
      var ary;
      ary = plv8.execute('SELECT uuid_generate_v4() as uuid;');
      return JSON.stringify(ary[0]);
    };

    Jrec.prototype.defaults = function() {
      var timestamp, uuid;
      uuid = JSON.parse(this.uuid());
      timestamp = new Date();
      return JSON.stringify({
        uuid: uuid.uuid,
        created_at: timestamp,
        updated_at: timestamp
      });
    };

    Jrec.prototype.create_table = function(schema_name, table_name) {
      plv8.execute("      CREATE TABLE " + schema_name + "." + table_name + " (\n      id serial NOT NULL,\n      data json DEFAULT jrec_uuid() NOT NULL,\n      CONSTRAINT " + schema_name + "_" + table_name + "_pkey PRIMARY KEY (id));\n\n      CREATE UNIQUE INDEX indx_" + schema_name + "_" + table_name + "_unique_uuid ON " + schema_name + "." + table_name + " (jrec_string(data,'uuid'));");
      return JSON.stringify(table_name);
    };

    Jrec.prototype.drop_table = function(schema_name, table_name) {
      plv8.execute("DROP TABLE IF EXISTS " + schema_name + "." + table_name + " CASCADE;");
      return JSON.stringify(table_name);
    };

    Jrec.prototype.create_index = function(schema_name, table_name, optns) {
      var cols, index_name, meth, name, sql, type, _ref, _ref1;
      index_name = "indx_" + schema_name + "_" + table_name;
      _ref = optns.cols;
      for (name in _ref) {
        type = _ref[name];
        index_name += "_" + name;
      }
      sql = ["CREATE"];
      if (optns.unique) {
        sql.push("UNIQUE");
      }
      sql.push("INDEX");
      if (optns.concurrently) {
        sql.push("CONCURRENTLY");
      }
      sql.push("" + index_name + " on " + schema_name + "." + table_name);
      sql.push("(");
      cols = [];
      _ref1 = optns.cols;
      for (name in _ref1) {
        type = _ref1[name];
        meth = "jrec_" + (type === 'text' ? 'string' : type);
        cols.push("" + meth + "(data,'" + name + "'::" + type + ")");
      }
      sql.push(cols.join(","));
      sql.push(")");
      sql = sql.join(" ");
      plv8.execute("DROP INDEX IF EXISTS " + index_name);
      plv8.execute(sql);
      return JSON.stringify(index_name);
    };

    Jrec.prototype.drop_index = function(schema_name, table_name, optns) {
      var index_name, name, type, _ref;
      index_name = "indx_" + schema_name + "_" + table_name;
      _ref = optns.cols;
      for (name in _ref) {
        type = _ref[name];
        index_name += "_" + name;
      }
      plv8.execute("DROP INDEX IF EXISTS " + index_name);
      return JSON.stringify(index_name);
    };

    Jrec.prototype.create_trigger = function(schema_name, table_name) {
      var sql, trigger_name;
      trigger_name = schema_name + "_" + table_name + "_trigger";
      sql = "CREATE TRIGGER " + trigger_name + " " +
            "AFTER INSERT OR UPDATE OR DELETE ON " + schema_name + "." + table_name + " " +
            "FOR EACH ROW EXECUTE PROCEDURE jrec_collection_trigger();";
      plv8.execute(sql);
      return JSON.stringify(trigger_name);
    };

    Jrec.prototype.query = function(_schema_name, _table_name, _query) {
      var builder, params, result, rows, search_path, sql, _ref;
      search_path = _schema_name === "public" ? _schema_name : "" + _schema_name + ", public";
      builder = new Builder(_schema_name, _table_name, search_path, _query);
      _ref = builder.build_select(), sql = _ref[0], params = _ref[1];
      rows = plv8.execute(sql, params);
      builder = null;
      if (_query.select === "*" || _.isArray(_query.select)) {
        result = _.pluck(rows, 'data');
      } else {
        result = rows;
      }
      return JSON.stringify(result);
    };

    Jrec.prototype.upsert = function(_schema_name, _table_name, _data) {
      var builder, data, params, query, result, rows, search_path, sql, sync, _ref, _ref1;
    
      data = _data;
      search_path = _schema_name === "public" ? _schema_name : "" + _schema_name + ",public";
      if (data.uuid != null) {
        query = {
          where: {
            uuid: data.uuid
          }
        };
        builder = new Builder(_schema_name, _table_name, search_path, query);
        sync = _data.__sync || true;
        delete _data.__sync;
        _ref = builder.build_update(data, sync), sql = _ref[0], params = _ref[1];
      } else {
        builder = new Builder(_schema_name, _table_name, search_path, {});
        _ref1 = builder.build_insert(data), sql = _ref1[0], params = _ref1[1];
      }
      rows = plv8.execute(sql, params);
      result = _.pluck(rows, 'data');
      if (result.length === 1) {
        result = result[0];
      }
      builder = null;
      return JSON.stringify(result);
    };

    Jrec.prototype.update = function(_schema_name, _table_name, _data, _cond) {
      var builder, params, result, rows, search_path, sql, sync, _ref;

      search_path = _schema_name === "public" ? _schema_name : "" + _schema_name + ",public";
      builder = new Builder(_schema_name, _table_name, search_path, {
        where: _cond
      });
      sync = _data.__sync || true;
      delete _data.__sync;
      _ref = builder.build_update(_data, sync), sql = _ref[0], params = _ref[1];
      rows = plv8.execute(sql, params);
      result = _.pluck(rows, 'data');
      if (result.length === 1) {
        result = result[0];
      }
      builder = null;
      return JSON.stringify(result);
    };

    Jrec.prototype.delete = function(_schema_name, _table_name, _cond) {
      var builder, params, plan, result, rows, search_path, sql, _ref;
      search_path = _schema_name === "public" ? _schema_name : "" + _schema_name + ",public";
      builder = new Builder(_schema_name, _table_name, search_path, {
        where: _cond
      });
      _ref = builder.build_delete(), sql = _ref[0], params = _ref[1];
      plan = plv8.prepare(sql);
      rows = plan.execute(params);
      result = _.pluck(rows, 'data');
      if (result.length === 1) {
        result = result[0];
      }
      builder = null;
      return JSON.stringify(result);
    };
  
    Jrec.prototype.collection_trigger = function(TG_TABLE_NAME, TG_OP, NEW, OLD) {
      var live_data;
      live_data = JSON.stringify({
        table_name: TG_TABLE_NAME,
        op: TG_OP,
        data: (NEW || OLD).data
      });
      plv8.execute("SELECT pg_notify('live', $1);", [live_data]);
    }
  
    var valueAt = function(data, key) {
      var i, keys;
      keys = key.split(".");
      for (i in keys) {
        if (data != null) {
          data = data[keys[i]];
        }
      }
      return data;
    };

    return Jrec;

  })();

    return root.Jrec = new Jrec();    
    
  }.call(this));
  
  })();

      
$$ LANGUAGE plv8 STABLE STRICT;
  
SELECT plv8_startup();  
  
CREATE or REPLACE FUNCTION jrec_json(_data json, _key text) RETURNS JSON AS $$
  return Jrec.json(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_string(_data json, _key text) RETURNS TEXT AS $$
  return Jrec.string(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_integer(_data json, _key text) RETURNS INT AS $$
  return Jrec.integer(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_integer_array(_data json, _key text) RETURNS INT[] AS $$
  return Jrec.integer_array(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_float(_data json, _key text) RETURNS DOUBLE PRECISION AS $$
  return Jrec.float(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_bool(_data json, _key text) RETURNS BOOLEAN AS $$
  return Jrec.bool(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_timestamp(_data json, _key text) RETURNS TIMESTAMP AS $$
  return Jrec.timestamp(_data, _key);
$$ LANGUAGE plv8 IMMUTABLE STRICT;



CREATE or REPLACE FUNCTION jrec_select(_data json, _fields text) RETURNS JSON AS $$
  return Jrec.select(_data, _fields); 
$$ LANGUAGE plv8 STABLE STRICT;



CREATE or REPLACE FUNCTION jrec_patch(_data json, _value json, _sync boolean) RETURNS JSON AS $$
  return Jrec.patch(_data, _value, _sync);
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_push(_data json, _key text, _value json) RETURNS JSON AS $$
  return Jrec.push(_data, _key, _value);
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_uuid() RETURNS JSON AS $$
  return Jrec.uuid();  
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_defaults() RETURNS JSON AS $$
  return Jrec.defaults();
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_create_table(schema_name text, table_name text) RETURNS void AS $$
  Jrec.create_table(schema_name, table_name);  
$$ LANGUAGE plv8 VOLATILE STRICT;

CREATE or REPLACE FUNCTION jrec_create_trigger(schema_name text, table_name text) RETURNS void AS $$  
  Jrec.create_trigger(schema_name, table_name);  
$$ LANGUAGE plv8 VOLATILE STRICT;

CREATE or REPLACE FUNCTION jrec_drop_table(schema_name text, table_name text) RETURNS void AS $$
  Jrec.drop_table(schema_name, table_name); 
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_create_index(schema_name text, table_name text, optns json) RETURNS void AS $$
  Jrec.create_index(schema_name, table_name, optns);
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_drop_index(schema_name text, table_name text, optns json) RETURNS void AS $$
  Jrec.drop_index(schema_name, table_name, optns);  
$$ LANGUAGE plv8 VOLATILE STRICT;



-- ##
-- # Select data
-- # SELECT query(_schema_name, _table_name, {where: {uuid: "12345"}});

CREATE or REPLACE FUNCTION jrec_query(_schema_name text, _table_name text, _query json) RETURNS json AS $$
  return Jrec.query(_schema_name, _table_name, _query);
$$ LANGUAGE plv8 STABLE STRICT;



-- ##
-- # Insert ot update row through validation!
-- # SELECT upsert('User', '{"name":"foo"}');

CREATE or REPLACE FUNCTION jrec_upsert(_schema_name text, _table_name text, _data json) RETURNS json AS $$
  return Jrec.upsert(_schema_name, _table_name, _data); 
$$ LANGUAGE plv8 VOLATILE STRICT;



-- ##
-- # Delete single row by uuid
-- # SELECT remove('users',uuid-1234567);

CREATE or REPLACE FUNCTION jrec_update(_schema_name text, _table_name text, _data json, _cond json) RETURNS json AS $$
  return Jrec.update(_schema_name, _table_name, _data, _cond);   
$$ LANGUAGE plv8 VOLATILE STRICT;



-- ##
-- # Delete single row by uuid
-- # SELECT remove('users',uuid-1234567);

CREATE or REPLACE FUNCTION jrec_delete(_schema_name text, _table_name text, _cond json) RETURNS json AS $$
  return Jrec.delete(_schema_name, _table_name, _cond);     
$$ LANGUAGE plv8 VOLATILE STRICT;



CREATE or REPLACE FUNCTION jrec_collection_trigger() RETURNS trigger AS $$
  Jrec.collection_trigger(TG_TABLE_NAME, TG_OP, NEW, OLD)
$$ LANGUAGE plv8 STABLE STRICT;