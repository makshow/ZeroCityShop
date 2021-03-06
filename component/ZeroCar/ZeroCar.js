/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Platform
} from 'react-native';

export default class ZeroCategory extends Component {

    static navigationOptions = ({ navigation }) => ({

        headerTitle:'购物车',

        // headerTitle: (
        //     <Text>
        //         点我搜索
        //     </Text>
        // <TouchableOpacity style={styles.searchBar}>
        //     <Image source={require('../../img/Home/search_icon.png')} style={styles.searchIcon} />
        //     <Paragraph>点我搜索</Paragraph>
        // </TouchableOpacity>
        // ),
        // headerRight: (
        //     <NavigationItem
        //         icon={require('../../img/Home/icon_navigationItem_message_white.png')}
        //         onPress={() => {
        //
        //         }}
        //     />
        // ),
        // headerLeft: (
        //     <NavigationItem
        //         title='上海'
        //         titleStyle={{ ZeroColor: 'white' }}
        //         onPress={() => {
        //
        //         }}
        //     />
        // ),
    })

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    购物车页面
                </Text>
            </View>
        );
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
});


