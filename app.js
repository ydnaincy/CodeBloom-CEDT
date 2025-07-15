import React, { useState, useEffect } from 'react';
import { 
  ShoppingCart, Home, BarChart3, Leaf, Brain, Zap, 
  Bell, User, Settings, Package, TrendingUp, MapPin,
  Smartphone, Scale, Camera, Coins, Award, ChevronRight,
  Activity, Battery, Wifi, Star, Heart, Search, Filter,
  Calendar, Clock, Globe, Shield, Eye, Lightbulb,
  Target, Truck, Recycle, AlertTriangle, CheckCircle
} from 'lucide-react';

const WalmartCEDTApp = () => {
  const [currentPage, setCurrentPage] = useState('dashboard');
  const [oatMilkLevel, setOatMilkLevel] = useState(85);
  const [greenCoins, setGreenCoins] = useState(1247);
  const [co2Saved, setCo2Saved] = useState(342);
  const [refillAlerts, setRefillAlerts] = useState([]);
  const [emotion, setEmotion] = useState('happy');

  useEffect(() => {
    const interval = setInterval(() => {
      setOatMilkLevel(prev => Math.max(0, prev - Math.random() * 2));
      if (oatMilkLevel < 15 && refillAlerts.length === 0) {
        setRefillAlerts([{
          id: 1,
          product: 'Oat Milk',
          predictedRunOut: 'July 14',
          ecoScore: 'A+',
          co2Savings: '220g'
        }]);
      }
    }, 5000);
    return () => clearInterval(interval);
  }, [oatMilkLevel, refillAlerts.length]);

  const TabBar = () => (
    <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 px-2 py-2 shadow-lg backdrop-blur-sm bg-white/95">
      <div className="flex justify-around">
        {[
          { id: 'dashboard', icon: Home, label: 'Home', badge: false },
          { id: 'smart-refill', icon: Package, label: 'Smart Refill', badge: refillAlerts.length > 0 },
          { id: 'analytics', icon: BarChart3, label: 'Analytics', badge: false },
          { id: 'sustainability', icon: Leaf, label: 'Green', badge: co2Saved > 300 },
          { id: 'profile', icon: User, label: 'Profile', badge: false }
        ].map(tab => (
          <button
            key={tab.id}
            onClick={() => setCurrentPage(tab.id)}
            className={`relative flex flex-col items-center py-2 px-3 rounded-xl transition-all duration-200 ${
              currentPage === tab.id 
                ? 'bg-gradient-to-br from-blue-100 to-blue-200 text-blue-600 shadow-md transform scale-105' 
                : 'text-gray-500 hover:text-gray-700 hover:bg-gray-50'
            }`}
          >
            <div className="relative">
              <tab.icon size={20} className={currentPage === tab.id ? 'animate-pulse' : ''} />
              {tab.badge && (
                <div className="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full animate-bounce"></div>
              )}
            </div>
            <span className={text-xs mt-1 font-medium ${currentPage === tab.id ? 'font-bold' : ''}}>
              {tab.label}
            </span>
            {currentPage === tab.id && (
              <div className="absolute -bottom-1 left-1/2 transform -translate-x-1/2 w-1 h-1 bg-blue-600 rounded-full"></div>
            )}
          </button>
        ))}
      </div>
    </div>
  );

  const Header = ({ title, showNotification = true }) => (
    <div className="bg-gradient-to-r from-blue-600 to-blue-700 text-white p-4 flex justify-between items-center shadow-lg">
      <div className="flex items-center space-x-3">
        <div className="w-10 h-10 bg-gradient-to-br from-yellow-400 to-yellow-500 rounded-full flex items-center justify-center shadow-md animate-pulse">
          <span className="text-blue-700 font-bold text-lg">W</span>
        </div>
        <div>
          <h1 className="text-lg font-bold">{title}</h1>
          <div className="text-xs text-blue-200">Real-time updates</div>
        </div>
      </div>
      <div className="flex items-center space-x-4">
        {showNotification && (
          <button 
            onClick={() => setCurrentPage('smart-refill')}
            className="relative p-2 hover:bg-blue-500 rounded-lg transition-colors"
          >
            <Bell size={20} className={refillAlerts.length > 0 ? 'animate-bounce' : ''} />
            {refillAlerts.length > 0 && (
              <div className="absolute -top-1 -right-1 bg-red-500 rounded-full w-4 h-4 flex items-center justify-center">
                <span className="text-xs font-bold text-white">{refillAlerts.length}</span>
              </div>
            )}
          </button>
        )}
        <div className="flex items-center space-x-2">
          <div className="flex items-center space-x-1">
            <Wifi size={16} className="animate-pulse" />
            <div className="w-1 h-1 bg-green-400 rounded-full animate-pulse"></div>
          </div>
          <div className="flex items-center space-x-1">
            <Battery size={16} />
            <div className="text-xs">94%</div>
          </div>
        </div>
      </div>
    </div>
  );

  const DashboardPage = () => (
    <div className="pb-20">
      <Header title="CEDT 2.0 Dashboard" />
      
      {/* Enhanced Quick Stats */}
      <div className="p-4 grid grid-cols-3 gap-4">
        <button 
          onClick={() => setCurrentPage('sustainability')}
          className="bg-gradient-to-br from-green-100 to-green-200 p-4 rounded-xl text-center shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-200 border border-green-300"
        >
          <div className="relative">
            <Leaf className="mx-auto text-green-600 mb-2 animate-pulse" size={24} />
            <div className="absolute -top-1 -right-1 w-3 h-3 bg-green-500 rounded-full animate-bounce"></div>
          </div>
          <div className="text-lg font-bold text-green-800">{co2Saved}g</div>
          <div className="text-xs text-green-600 font-medium">CO₂ Saved</div>
          <div className="mt-1 text-xs text-green-500">↗ +12g today</div>
        </button>
        
        <button 
          onClick={() => setCurrentPage('sustainability')}
          className="bg-gradient-to-br from-yellow-100 to-yellow-200 p-4 rounded-xl text-center shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-200 border border-yellow-300"
        >
          <div className="relative">
            <Coins className="mx-auto text-yellow-600 mb-2" size={24} />
            <div className="absolute -top-1 -right-1 w-3 h-3 bg-yellow-500 rounded-full animate-ping"></div>
          </div>
          <div className="text-lg font-bold text-yellow-800">{greenCoins}</div>
          <div className="text-xs text-yellow-600 font-medium">GreenCoins</div>
          <div className="mt-1 text-xs text-yellow-500">+45 earned</div>
        </button>
        
        <button 
          onClick={() => setCurrentPage('analytics')}
          className="bg-gradient-to-br from-blue-100 to-blue-200 p-4 rounded-xl text-center shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-200 border border-blue-300"
        >
          <TrendingUp className="mx-auto text-blue-600 mb-2" size={24} />
          <div className="text-lg font-bold text-blue-800">99.5%</div>
          <div className="text-xs text-blue-600 font-medium">Availability</div>
          <div className="mt-1 text-xs text-blue-500">Real-time</div>
        </button>
      </div>

      {/* Enhanced Refill Alerts */}
      {refillAlerts.length > 0 && (
        <div className="mx-4 mb-4">
          <div className="bg-gradient-to-r from-orange-50 to-red-50 border border-orange-200 rounded-xl p-4 shadow-lg">
            <div className="flex items-center justify-between mb-3">
              <div className="flex items-center space-x-2">
                <div className="relative">
                  <AlertTriangle className="text-orange-500 animate-bounce" size={24} />
                  <div className="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full animate-pulse"></div>
                </div>
                <span className="font-bold text-orange-800">Smart Refill Alert</span>
              </div>
              <button 
                onClick={() => setCurrentPage('smart-refill')}
                className="text-orange-600 text-sm hover:text-orange-800 font-medium flex items-center space-x-1 group"
              >
                <span>View All</span>
                <ChevronRight size={14} className="group-hover:translate-x-1 transition-transform" />
              </button>
            </div>
            <div className="text-sm text-gray-700 mb-3">
              🥛 Your oat milk will run out on July 14. Shall we refill sustainably?
            </div>
            <div className="flex space-x-2">
              <button 
                onClick={() => {
                  setRefillAlerts([]);
                  setGreenCoins(prev => prev + 45);
                }}
                className="bg-gradient-to-r from-green-500 to-green-600 text-white px-6 py-2 rounded-lg text-sm font-medium hover:from-green-600 hover:to-green-700 transform hover:scale-105 transition-all duration-200 shadow-md"
              >
                ✅ Auto-Refill
              </button>
              <button 
                onClick={() => setRefillAlerts([])}
                className="border border-gray-300 px-6 py-2 rounded-lg text-sm hover:bg-gray-50 transition-colors"
              >
                ⏰ Remind Later
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Enhanced Live Twin Metrics */}
      <div className="mx-4 mb-4">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-bold">Live Twin Metrics</h2>
          <button 
            onClick={() => setCurrentPage('analytics')}
            className="text-blue-600 text-sm hover:text-blue-800 flex items-center space-x-1 group"
          >
            <Activity size={16} />
            <span>View Details</span>
            <ChevronRight size={14} className="group-hover:translate-x-1 transition-transform" />
          </button>
        </div>
        <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-4 shadow-lg">
          <button 
            onClick={() => setCurrentPage('analytics')}
            className="w-full flex justify-between items-center hover:bg-gray-50 p-2 rounded-lg transition-colors group"
          >
            <div className="flex items-center space-x-2">
              <TrendingUp className="text-green-600" size={16} />
              <span className="text-sm text-gray-700">Cost Optimization</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-24 h-3 bg-gray-200 rounded-full overflow-hidden">
                <div className="w-4/5 h-3 bg-gradient-to-r from-green-400 to-green-600 rounded-full animate-pulse"></div>
              </div>
              <span className="text-sm font-semibold text-green-600">↓23%</span>
              <ChevronRight size={14} className="text-gray-400 group-hover:translate-x-1 transition-transform" />
            </div>
          </button>
          
          <button 
            onClick={() => setCurrentPage('sustainability')}
            className="w-full flex justify-between items-center hover:bg-gray-50 p-2 rounded-lg transition-colors group"
          >
            <div className="flex items-center space-x-2">
              <Leaf className="text-blue-600" size={16} />
              <span className="text-sm text-gray-700">CO₂ Reduction</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-24 h-3 bg-gray-200 rounded-full overflow-hidden">
                <div className="w-4/5 h-3 bg-gradient-to-r from-blue-400 to-blue-600 rounded-full animate-pulse"></div>
              </div>
              <span className="text-sm font-semibold text-blue-600">↓45%</span>
              <ChevronRight size={14} className="text-gray-400 group-hover:translate-x-1 transition-transform" />
            </div>
          </button>
          
          <button 
            onClick={() => setCurrentPage('smart-refill')}
            className="w-full flex justify-between items-center hover:bg-gray-50 p-2 rounded-lg transition-colors group"
          >
            <div className="flex items-center space-x-2">
              <Package className="text-yellow-600" size={16} />
              <span className="text-sm text-gray-700">Freshness Score</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-24 h-3 bg-gray-200 rounded-full overflow-hidden">
                <div className="w-full h-3 bg-gradient-to-r from-yellow-400 to-yellow-600 rounded-full animate-pulse"></div>
              </div>
              <span className="text-sm font-semibold text-yellow-600">98.2%</span>
              <ChevronRight size={14} className="text-gray-400 group-hover:translate-x-1 transition-transform" />
            </div>
          </button>
        </div>
      </div>

      {/* Enhanced Quick Actions */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Quick Actions</h2>
        <div className="grid grid-cols-2 gap-4">
          <button
            onClick={() => setCurrentPage('ai-coach')}
            className="bg-gradient-to-br from-purple-100 to-purple-200 border border-purple-300 rounded-xl p-5 flex flex-col items-center space-y-3 hover:from-purple-200 hover:to-purple-300 transform hover:scale-105 transition-all duration-200 shadow-lg hover:shadow-xl group"
          >
            <div className="relative">
              <Brain className="text-purple-600 group-hover:animate-pulse" size={32} />
              <div className="absolute -top-1 -right-1 w-3 h-3 bg-purple-500 rounded-full animate-bounce"></div>
            </div>
            <span className="text-sm font-bold text-purple-800">AI Coach</span>
            <span className="text-xs text-purple-600 text-center">Get personalized sustainability tips</span>
          </button>
          
          <button
            onClick={() => setCurrentPage('emotion-cam')}
            className="bg-gradient-to-br from-pink-100 to-pink-200 border border-pink-300 rounded-xl p-5 flex flex-col items-center space-y-3 hover:from-pink-200 hover:to-pink-300 transform hover:scale-105 transition-all duration-200 shadow-lg hover:shadow-xl group"
          >
            <div className="relative">
              <Camera className="text-pink-600 group-hover:animate-pulse" size={32} />
              <div className="absolute -bottom-1 -right-1 w-3 h-3 bg-pink-500 rounded-full animate-ping"></div>
            </div>
            <span className="text-sm font-bold text-pink-800">Emotion Cam</span>
            <span className="text-xs text-pink-600 text-center">AI emotion recognition</span>
          </button>
          
          <button
            onClick={() => setCurrentPage('quantum')}
            className="bg-gradient-to-br from-indigo-100 to-indigo-200 border border-indigo-300 rounded-xl p-5 flex flex-col items-center space-y-3 hover:from-indigo-200 hover:to-indigo-300 transform hover:scale-105 transition-all duration-200 shadow-lg hover:shadow-xl group"
          >
            <div className="relative">
              <Zap className="text-indigo-600 group-hover:animate-bounce" size={32} />
              <div className="absolute -top-1 -left-1 w-2 h-2 bg-indigo-400 rounded-full animate-pulse"></div>
            </div>
            <span className="text-sm font-bold text-indigo-800">Quantum Optimizer</span>
            <span className="text-xs text-indigo-600 text-center">Route optimization engine</span>
          </button>
          
          <button
            onClick={() => setCurrentPage('zk-proofs')}
            className="bg-gradient-to-br from-emerald-100 to-emerald-200 border border-emerald-300 rounded-xl p-5 flex flex-col items-center space-y-3 hover:from-emerald-200 hover:to-emerald-300 transform hover:scale-105 transition-all duration-200 shadow-lg hover:shadow-xl group"
          >
            <div className="relative">
              <Shield className="text-emerald-600 group-hover:animate-pulse" size={32} />
              <CheckCircle className="absolute -bottom-1 -right-1 text-emerald-500" size={12} />
            </div>
            <span className="text-sm font-bold text-emerald-800">ZK Proofs</span>
            <span className="text-xs text-emerald-600 text-center">Cryptographic verification</span>
          </button>
        </div>
      </div>

      {/* New Real-time Status Bar */}
      <div className="mx-4 mb-4">
        <div className="bg-gradient-to-r from-gray-100 to-gray-200 border border-gray-300 rounded-xl p-3 shadow-lg">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-4">
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                <span className="text-xs text-gray-700">System Online</span>
              </div>
              <div className="flex items-center space-x-2">
                <Zap className="text-yellow-500" size={12} />
                <span className="text-xs text-gray-700">4.2M routes/s</span>
              </div>
            </div>
            <button 
              onClick={() => setCurrentPage('analytics')}
              className="text-xs text-blue-600 hover:text-blue-800 flex items-center space-x-1 group"
            >
              <span>Monitor</span>
              <Activity size={12} className="group-hover:animate-pulse" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );

  const SmartRefillPage = () => (
    <div className="pb-20">
      <Header title="Smart Refill Intelligence" />
      
      {/* IoT Device Status */}
      <div className="p-4">
        <h2 className="text-lg font-bold mb-3">Connected Devices</h2>
        <div className="space-y-3">
          <div className="bg-white border border-gray-200 rounded-lg p-4">
            <div className="flex items-center justify-between mb-2">
              <div className="flex items-center space-x-3">
                <Scale className="text-blue-600" size={20} />
                <div>
                  <div className="font-semibold">Smart Kitchen Scale</div>
                  <div className="text-sm text-gray-500">Kitchen Counter</div>
                </div>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                <span className="text-sm text-green-600">Online</span>
              </div>
            </div>
            <div className="mt-3">
              <div className="flex justify-between text-sm mb-1">
                <span>Oat Milk Level</span>
                <span>{Math.round(oatMilkLevel)}%</span>
              </div>
              <div className="w-full h-2 bg-gray-200 rounded-full">
                <div 
                  className={`h-2 rounded-full transition-all duration-500 ${
                    oatMilkLevel > 50 ? 'bg-green-500' : 
                    oatMilkLevel > 20 ? 'bg-yellow-500' : 'bg-red-500'
                  }`}
                  style={{ width: ${oatMilkLevel}% }}
                ></div>
              </div>
            </div>
          </div>

          <div className="bg-white border border-gray-200 rounded-lg p-4">
            <div className="flex items-center justify-between mb-2">
              <div className="flex items-center space-x-3">
                <Smartphone className="text-green-600" size={20} />
                <div>
                  <div className="font-semibold">Smart Fridge Sensor</div>
                  <div className="text-sm text-gray-500">Main Refrigerator</div>
                </div>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                <span className="text-sm text-green-600">Online</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Predictive Analytics */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">SARIMAX Predictions</h2>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <div className="mb-4">
            <div className="text-sm text-gray-600 mb-2">Next 7 Days Consumption Forecast</div>
            <div className="flex justify-between items-end h-20 space-x-1">
              {[65, 52, 48, 38, 25, 15, 8].map((height, i) => (
                <div key={i} className="flex-1 flex flex-col items-center">
                  <div 
                    className="w-full bg-blue-400 rounded-t"
                    style={{ height: ${height}% }}
                  ></div>
                  <span className="text-xs text-gray-500 mt-1">
                    {new Date(Date.now() + i * 24 * 60 * 60 * 1000).toLocaleDateString('en', { weekday: 'short' })}
                  </span>
                </div>
              ))}
            </div>
          </div>
          <div className="border-t pt-3">
            <div className="text-sm text-orange-600 font-medium">
              ⚠ Predicted stockout: July 14, 2025
            </div>
            <div className="text-xs text-gray-500 mt-1">
              Confidence: 94.2% | Model: SARIMAX(2,1,2)
            </div>
          </div>
        </div>
      </div>

      {/* Refill Options */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Eco-Optimal Refill Options</h2>
        <div className="space-y-3">
          <div className="bg-green-50 border border-green-200 rounded-lg p-4">
            <div className="flex justify-between items-start mb-2">
              <div>
                <div className="font-semibold text-green-800">Local Farm Co-op</div>
                <div className="text-sm text-green-600">2.3 miles away</div>
              </div>
              <div className="text-right">
                <div className="text-sm font-semibold text-green-700">$4.99</div>
                <div className="text-xs text-green-600">220g CO₂ saved</div>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-2">
                <Award className="text-green-600" size={16} />
                <span className="text-sm text-green-700">Eco Score: A+</span>
              </div>
              <button className="bg-green-600 text-white px-4 py-2 rounded-lg text-sm">
                Select
              </button>
            </div>
          </div>

          <div className="bg-white border border-gray-200 rounded-lg p-4">
            <div className="flex justify-between items-start mb-2">
              <div>
                <div className="font-semibold">Walmart Supercenter</div>
                <div className="text-sm text-gray-600">5.7 miles away</div>
              </div>
              <div className="text-right">
                <div className="text-sm font-semibold">$3.97</div>
                <div className="text-xs text-gray-600">140g CO₂ saved</div>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-2">
                <Award className="text-yellow-600" size={16} />
                <span className="text-sm text-gray-700">Eco Score: B+</span>
              </div>
              <button className="border border-gray-300 px-4 py-2 rounded-lg text-sm">
                Select
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const AnalyticsPage = () => (
    <div className="pb-20">
      <Header title="Twin Analytics & Insights" />
      
      {/* Quantum Optimization Stats */}
      <div className="p-4">
        <h2 className="text-lg font-bold mb-3">Quantum Route Optimization</h2>
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="grid grid-cols-2 gap-4 mb-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-indigo-600">4.2M</div>
              <div className="text-sm text-gray-600">Routes Analyzed</div>
            </div>
            <div className="text-center">
              <div className="text-2xl font-bold text-indigo-600">1.3s</div>
              <div className="text-sm text-gray-600">Processing Time</div>
            </div>
          </div>
          <div className="border-t pt-3">
            <div className="text-sm text-gray-700">
              Current optimization algorithm: QUBO + Reinforcement Learning
            </div>
            <div className="text-xs text-gray-500 mt-1">
              Last updated: 2 minutes ago
            </div>
          </div>
        </div>
      </div>

      {/* Causal Analysis */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Causal Insights</h2>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <div className="mb-4">
            <div className="text-sm font-semibold text-red-600 mb-2">
              🔍 Root Cause Detected
            </div>
            <div className="text-sm text-gray-700">
              Spike in waste → Fridge outage in Distribution Center DC-12
            </div>
            <div className="text-xs text-gray-500 mt-1">
              Confidence: 89% | Impact: High
            </div>
          </div>
          <button 
            onClick={() => setCurrentPage('causal-graph')}
            className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm w-full"
          >
            View Causal Graph
          </button>
        </div>
      </div>

      {/* Performance Metrics */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">System Performance</h2>
        <div className="space-y-3">
          {[
            { label: 'Prediction Accuracy', value: '94.2%', color: 'green' },
            { label: 'Response Time', value: '< 200ms', color: 'blue' },
            { label: 'Data Freshness', value: '99.1%', color: 'yellow' },
            { label: 'ZK Proof Verification', value: '100%', color: 'purple' }
          ].map(metric => (
            <div key={metric.label} className="bg-white border border-gray-200 rounded-lg p-3">
              <div className="flex justify-between items-center">
                <span className="text-sm text-gray-700">{metric.label}</span>
                <span className="text-sm font-semibold text-gray-600">
                  {metric.value}
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const SustainabilityPage = () => (
    <div className="pb-20">
      <Header title="Sustainability Impact" />
      
      {/* Carbon Impact */}
      <div className="p-4">
        <h2 className="text-lg font-bold mb-3">Carbon Footprint</h2>
        <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-4">
          <div className="text-center mb-4">
            <div className="text-3xl font-bold text-green-700">{co2Saved}g</div>
            <div className="text-sm text-green-600">CO₂ Saved This Month</div>
          </div>
          <div className="grid grid-cols-3 gap-4 text-center">
            <div>
              <div className="text-lg font-semibold text-green-700">36%</div>
              <div className="text-xs text-green-600">Reduction</div>
            </div>
            <div>
              <div className="text-lg font-semibold text-green-700">15.2kg</div>
              <div className="text-xs text-green-600">Total Saved</div>
            </div>
            <div>
              <div className="text-lg font-semibold text-green-700">A+</div>
              <div className="text-xs text-green-600">Eco Rating</div>
            </div>
          </div>
        </div>
      </div>

      {/* Zero-Knowledge Proofs */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Verified Impact</h2>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center space-x-2">
              <Shield className="text-green-600" size={20} />
              <span className="font-semibold">ZK-SNARK Verified</span>
            </div>
            <CheckCircle className="text-green-600" size={20} />
          </div>
          <div className="text-sm text-gray-700 mb-3">
            Your sustainability claims are cryptographically verified on Polygon testnet.
          </div>
          <button 
            onClick={() => setCurrentPage('zk-proofs')}
            className="bg-purple-600 text-white px-4 py-2 rounded-lg text-sm w-full"
          >
            View Proof Details
          </button>
        </div>
      </div>

      {/* GreenCoins Wallet */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">GreenCoins Wallet</h2>
        <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center space-x-2">
              <Coins className="text-yellow-600" size={20} />
              <span className="font-semibold">Balance</span>
            </div>
            <span className="text-xl font-bold text-yellow-700">{greenCoins}</span>
          </div>
          <div className="text-sm text-gray-700 mb-3">
            Earned through eco-friendly choices and verified sustainability actions.
          </div>
          <div className="grid grid-cols-2 gap-2">
            <button className="bg-yellow-600 text-white px-3 py-2 rounded-lg text-sm">
              Redeem Rewards
            </button>
            <button className="border border-yellow-600 text-yellow-600 px-3 py-2 rounded-lg text-sm">
              Earn More
            </button>
          </div>
        </div>
      </div>

      {/* Circular Economy Progress */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Circular Economy Goals</h2>
        <div className="space-y-3">
          {[
            { goal: 'Zero Food Waste', progress: 78, icon: Recycle },
            { goal: 'Local Sourcing', progress: 65, icon: MapPin },
            { goal: 'Packaging Reduction', progress: 82, icon: Package }
          ].map(item => (
            <div key={item.goal} className="bg-white border border-gray-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center space-x-2">
                  <item.icon className="text-blue-600" size={16} />
                  <span className="text-sm font-medium">{item.goal}</span>
                </div>
                <span className="text-sm font-semibold">{item.progress}%</span>
              </div>
              <div className="w-full h-2 bg-gray-200 rounded-full">
                <div 
                  className="h-2 bg-blue-500 rounded-full transition-all"
                  style={{ width: ${item.progress}% }}
                ></div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const ProfilePage = () => (
    <div className="pb-20">
      <Header title="Profile & Settings" />
      
      {/* User Profile */}
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="flex items-center space-x-4 mb-4">
            <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center">
              <User className="text-blue-600" size={24} />
            </div>
            <div>
              <div className="font-semibold text-lg">Alex Johnson</div>
              <div className="text-sm text-gray-600">Eco Champion</div>
              <div className="text-xs text-gray-500">Member since Jan 2024</div>
            </div>
          </div>
          <div className="grid grid-cols-3 gap-4 text-center">
            <div>
              <div className="text-lg font-semibold text-green-600">{co2Saved}g</div>
              <div className="text-xs text-gray-600">CO₂ Saved</div>
            </div>
            <div>
              <div className="text-lg font-semibold text-yellow-600">{greenCoins}</div>
              <div className="text-xs text-gray-600">GreenCoins</div>
            </div>
            <div>
              <div className="text-lg font-semibold text-blue-600">A+</div>
              <div className="text-xs text-gray-600">Eco Score</div>
            </div>
          </div>
        </div>
      </div>

      {/* Quick Settings */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">Settings</h2>
        <div className="space-y-3">
          {[
            { icon: Bell, label: 'Notifications', page: 'notifications' },
            { icon: Smartphone, label: 'Connected Devices', page: 'devices' },
            { icon: Eye, label: 'Privacy & Security', page: 'privacy' },
            { icon: Lightbulb, label: 'AI Preferences', page: 'ai-settings' },
            { icon: Target, label: 'Sustainability Goals', page: 'goals' }
          ].map(setting => (
            <button
              key={setting.page}
              onClick={() => setCurrentPage(setting.page)}
              className="w-full bg-white border border-gray-200 rounded-lg p-4 flex items-center justify-between hover:bg-gray-50 transition-colors"
            >
              <div className="flex items-center space-x-3">
                <setting.icon className="text-gray-600" size={20} />
                <span className="font-medium">{setting.label}</span>
              </div>
              <ChevronRight className="text-gray-400" size={16} />
            </button>
          ))}
        </div>
      </div>

      {/* App Info */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3">About</h2>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <div className="text-sm text-gray-700 mb-2">
            <strong>CEDT 2.0</strong> - Circular Economy Digital Twin
          </div>
          <div className="text-xs text-gray-500 mb-3">
            Version 2.0.1 | Build 2025.07.14
          </div>
          <div className="text-xs text-gray-600 leading-relaxed">
            Powered by quantum-inspired optimization, reinforcement learning, 
            and zero-knowledge cryptography for provable sustainability.
          </div>
        </div>
      </div>
    </div>
  );

  // Additional specialized pages
  const EmotionCamPage = () => (
    <div className="pb-20">
      <Header title="Emotion Recognition" />
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="text-center mb-4">
            <Camera className="mx-auto text-pink-600 mb-4" size={48} />
            <div className="text-lg font-bold mb-2">Live Emotion Analysis</div>
            <div className="text-sm text-gray-600">DeepFace AI analyzing customer sentiment</div>
          </div>
          <div className="bg-pink-50 border border-pink-200 rounded-lg p-4">
            <div className="flex items-center justify-center mb-3">
              <div className="text-4xl">{emotion === 'happy' ? '😊' : emotion === 'neutral' ? '😐' : '😔'}</div>
            </div>
            <div className="text-center">
              <div className="font-semibold text-pink-800 capitalize">{emotion}</div>
              <div className="text-sm text-pink-600">Confidence: 87.3%</div>
            </div>
          </div>
          <div className="mt-4 space-y-2">
            <button 
              onClick={() => setEmotion('happy')}
              className="w-full bg-green-100 text-green-800 py-2 rounded-lg text-sm"
            >
              😊 Happy - Show eco-friendly options
            </button>
            <button 
              onClick={() => setEmotion('neutral')}
              className="w-full bg-yellow-100 text-yellow-800 py-2 rounded-lg text-sm"
            >
              😐 Neutral - Standard recommendations
            </button>
            <button 
              onClick={() => setEmotion('stressed')}
              className="w-full bg-red-100 text-red-800 py-2 rounded-lg text-sm"
            >
              😔 Stressed - Quick convenience options
            </button>
          </div>
        </div>
      </div>
    </div>
  );

  const QuantumPage = () => (
    <div className="pb-20">
      <Header title="Quantum Optimization Engine" />
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="text-center mb-4">
            <Zap className="mx-auto text-indigo-600 mb-4" size={48} />
            <div className="text-lg font-bold mb-2">QUBO + RL Hybrid</div>
            <div className="text-sm text-gray-600">Quantum-inspired route optimization</div>
          </div>
          <div className="grid grid-cols-2 gap-4 mb-4">
            <div className="bg-indigo-50 p-3 rounded-lg text-center">
              <div className="text-xl font-bold text-indigo-600">4.2M</div>
              <div className="text-xs text-indigo-600">Routes Solved</div>
            </div>
            <div className="bg-indigo-50 p-3 rounded-lg text-center">
              <div className="text-xl font-bold text-indigo-600">1.3s</div>
              <div className="text-xs text-indigo-600">Processing Time</div>
            </div>
          </div>
          <div className="space-y-2">
            <div className="flex justify-between text-sm">
              <span>Optimization Progress</span>
              <span>94%</span>
            </div>
            <div className="w-full h-2 bg-gray-200 rounded-full">
              <div className="w-11/12 h-2 bg-indigo-500 rounded-full animate-pulse"></div>
            </div>
          </div>
        </div>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <h3 className="font-bold mb-3">Swarm Intelligence</h3>
          <div className="text-sm text-gray-700 mb-3">
            Using particle swarm optimization for delivery coordination across 247 vehicles.
          </div>
          <div className="grid grid-cols-3 gap-3 text-center text-xs">
            <div>
              <div className="font-semibold">36%</div>
              <div className="text-gray-500">Fuel Saved</div>
            </div>
            <div>
              <div className="font-semibold">97.2%</div>
              <div className="text-gray-500">On-Time</div>
            </div>
            <div>
              <div className="font-semibold">23%</div>
              <div className="text-gray-500">Cost Reduction</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const ZKProofsPage = () => (
    <div className="pb-20">
      <Header title="Zero-Knowledge Proofs" />
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="text-center mb-4">
            <Shield className="mx-auto text-emerald-600 mb-4" size={48} />
            <div className="text-lg font-bold mb-2">Cryptographic Verification</div>
            <div className="text-sm text-gray-600">Proving sustainability without revealing data</div>
          </div>
          <div className="space-y-3">
            <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium">CO₂ Target Achievement</span>
                <CheckCircle className="text-emerald-600" size={16} />
              </div>
              <div className="text-xs text-gray-600">
                Proof Hash: 0x7f4a9c...8b2e1d
              </div>
              <div className="text-xs text-gray-500">
                Verified on Polygon • Block #47829156
              </div>
            </div>
            <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium">Supply Chain Integrity</span>
                <CheckCircle className="text-emerald-600" size={16} />
              </div>
              <div className="text-xs text-gray-600">
                Proof Hash: 0x3c8f2a...9d4b7c
              </div>
              <div className="text-xs text-gray-500">
                Verified on Polygon • Block #47829098
              </div>
            </div>
          </div>
        </div>
        <div className="bg-white border border-gray-200 rounded-lg p-4">
          <h3 className="font-bold mb-3">SNARK Circuit Details</h3>
          <div className="text-sm text-gray-700 mb-3">
            Custom zk-SNARK circuit validates Scope 3 emissions without exposing sensitive business data.
          </div>
          <div className="bg-gray-50 p-3 rounded text-xs font-mono">
            circuit CO2Proof(public targetCO2, private actualCO2) {'{'}
            <br />
            &nbsp;&nbsp;assert(actualCO2 &lt;= targetCO2);
            <br />
            &nbsp;&nbsp;return hash(actualCO2);
            <br />
            {'}'}
          </div>
        </div>
      </div>
    </div>
  );

  const AiCoachPage = () => (
    <div className="pb-20">
      <Header title="AI Sustainability Coach" />
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-lg p-4 mb-4">
          <div className="text-center mb-4">
            <Brain className="mx-auto text-purple-600 mb-4" size={48} />
            <div className="text-lg font-bold mb-2">GPT-4o Powered Coach</div>
            <div className="text-sm text-gray-600">Personalized sustainability guidance</div>
          </div>
          <div className="bg-purple-50 border border-purple-200 rounded-lg p-4 mb-4">
            <div className="text-sm font-medium text-purple-800 mb-2">
              💡 Today's Insight
            </div>
            <div className="text-sm text-purple-700">
              "Switching to local oat milk will save 220g CO₂ and earn you 45 GreenCoins!"
            </div>
          </div>
          <div className="space-y-3">
            <div className="bg-white border border-gray-200 rounded-lg p-3">
              <div className="text-sm font-medium mb-1">Weekly Challenge</div>
              <div className="text-sm text-gray-600 mb-2">
                Reduce packaging waste by 30%
              </div>
              <div className="flex justify-between items-center">
                <div className="w-32 h-2 bg-gray-200 rounded-full">
                  <div className="w-3/4 h-2 bg-purple-500 rounded-full"></div>
                </div>
                <span className="text-xs text-purple-600">75%</span>
              </div>
            </div>
            <button className="w-full bg-purple-600 text-white py-3 rounded-lg">
              Chat with AI Coach
            </button>
          </div>
        </div>
      </div>
    </div>
  );

  const CausalGraphPage = () => (
    <div className="pb-20">
      <Header title="Causal Analysis Engine" />
      
      {/* Main Causal Graph */}
      <div className="p-4">
        <div className="bg-white border border-gray-200 rounded-xl p-4 mb-4 shadow-lg">
          <div className="text-center mb-4">
            <Activity className="mx-auto text-blue-600 mb-4 animate-pulse" size={48} />
            <div className="text-lg font-bold mb-2">DoWhy Causal Model</div>
            <div className="text-sm text-gray-600">Root cause analysis with 89% confidence</div>
          </div>
          
          {/* Enhanced Causal Chain */}
          <div className="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-xl p-4 mb-4">
            <div className="text-sm font-medium text-blue-800 mb-3 flex items-center">
              <Target className="mr-2" size={16} />
              🔍 Detected Causal Chain
            </div>
            <div className="space-y-3">
              <div className="flex items-center space-x-3 p-2 bg-white rounded-lg shadow-sm">
                <div className="w-8 h-8 bg-red-500 rounded-full flex items-center justify-center">
                  <span className="text-white text-xs font-bold">1</span>
                </div>
                <div className="flex-1">
                  <div className="text-sm font-medium text-gray-800">Power outage in DC-12</div>
                  <div className="text-xs text-gray-500">Root cause identified</div>
                </div>
                <div className="text-xs text-red-600 font-medium">Critical</div>
              </div>
              
              <div className="flex items-center space-x-3 p-2 bg-white rounded-lg shadow-sm">
                <div className="w-8 h-8 bg-orange-500 rounded-full flex items-center justify-center">
                  <span className="text-white text-xs font-bold">2</span>
                </div>
                <div className="flex-1">
                  <div className="text-sm font-medium text-gray-800">Temperature rise (+12°C)</div>
                  <div className="text-xs text-gray-500">Immediate effect</div>
                </div>
                <div className="text-xs text-orange-600 font-medium">High</div>
              </div>
              
              <div className="flex items-center space-x-3 p-2 bg-white rounded-lg shadow-sm">
                <div className="w-8 h-8 bg-yellow-500 rounded-full flex items-center justify-center">
                  <span className="text-white text-xs font-bold">3</span>
                </div>
                <div className="flex-1">
                  <div className="text-sm font-medium text-gray-800">Accelerated spoilage</div>
                  <div className="text-xs text-gray-500">Secondary effect</div>
                </div>
                <div className="text-xs text-yellow-600 font-medium">Medium</div>
              </div>
              
              <div className="flex items-center space-x-3 p-2 bg-white rounded-lg shadow-sm">
                <div className="w-8 h-8 bg-green-600 rounded-full flex items-center justify-center">
                  <span className="text-white text-xs font-bold">4</span>
                </div>
                <div className="flex-1">
                  <div className="text-sm font-medium text-gray-800">23% waste increase</div>
                  <div className="text-xs text-gray-500">Final outcome</div>
                </div>
                <div className="text-xs text-green-600 font-medium">Measured</div>
              </div>
            </div>
          </div>
          
          {/* Interactive Causal Graph */}
          <div className="bg-gray-50 rounded-xl p-4 mb-4">
            <div className="text-sm font-medium mb-3 text-center">Interactive Causal Network</div>
            <svg viewBox="0 0 400 250" className="w-full h-40 border rounded-lg bg-white">
              {/* Nodes */}
              <circle cx="70" cy="60" r="25" fill="#ef4444" className="animate-pulse" />
              <text x="70" y="45" textAnchor="middle" className="text-xs fill-white font-bold">Power</text>
              <text x="70" y="58" textAnchor="middle" className="text-xs fill-white font-bold">Outage</text>
              <text x="70" y="90" textAnchor="middle" className="text-xs fill-gray-600">DC-12</text>
              
              <circle cx="160" cy="60" r="25" fill="#f59e0b" />
              <text x="160" y="45" textAnchor="middle" className="text-xs fill-white font-bold">Temp</text>
              <text x="160" y="58" textAnchor="middle" className="text-xs fill-white font-bold">Rise</text>
              <text x="160" y="90" textAnchor="middle" className="text-xs fill-gray-600">+12°C</text>
              
              <circle cx="250" cy="60" r="25" fill="#eab308" />
              <text x="250" y="45" textAnchor="middle" className="text-xs fill-white font-bold">Food</text>
              <text x="250" y="58" textAnchor="middle" className="text-xs fill-white font-bold">Spoil</text>
              <text x="250" y="90" textAnchor="middle" className="text-xs fill-gray-600">Rate x3</text>
              
              <circle cx="340" cy="60" r="25" fill="#16a34a" />
              <text x="340" y="45" textAnchor="middle" className="text-xs fill-white font-bold">Waste</text>
              <text x="340" y="58" textAnchor="middle" className="text-xs fill-white font-bold">↑23%</text>
              <text x="340" y="90" textAnchor="middle" className="text-xs fill-gray-600">$47K</text>
              
              {/* Secondary factors */}
              <circle cx="160" cy="150" r="20" fill="#8b5cf6" />
              <text x="160" y="145" textAnchor="middle" className="text-xs fill-white font-bold">HVAC</text>
              <text x="160" y="158" textAnchor="middle" className="text-xs fill-white font-bold">Fail</text>
              
              <circle cx="250" cy="150" r="20" fill="#ec4899" />
              <text x="250" y="145" textAnchor="middle" className="text-xs fill-white font-bold">Supply</text>
              <text x="250" y="158" textAnchor="middle" className="text-xs fill-white font-bold">Chain</text>
              
              {/* Arrows */}
              <defs>
                <marker id="arrowhead2" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
                  <polygon points="0 0, 10 3.5, 0 7" fill="#666" />
                </marker>
              </defs>
              
              <line x1="95" y1="60" x2="135" y2="60" stroke="#666" strokeWidth="3" markerEnd="url(#arrowhead2)" className="animate-pulse" />
              <line x1="185" y1="60" x2="225" y2="60" stroke="#666" strokeWidth="3" markerEnd="url(#arrowhead2)" />
              <line x1="275" y1="60" x2="315" y2="60" stroke="#666" strokeWidth="3" markerEnd="url(#arrowhead2)" />
              
              {/* Secondary connections */}
              <line x1="160" y1="130" x2="160" y2="85" stroke="#8b5cf6" strokeWidth="2" markerEnd="url(#arrowhead2)" strokeDasharray="5,5" />
              <line x1="250" y1="130" x2="250" y2="85" stroke="#ec4899" strokeWidth="2" markerEnd="url(#arrowhead2)" strokeDasharray="5,5" />
              
              {/* Confidence indicators */}
              <text x="115" y="50" textAnchor="middle" className="text-xs fill-green-600 font-bold">94%</text>
              <text x="205" y="50" textAnchor="middle" className="text-xs fill-green-600 font-bold">87%</text>
              <text x="295" y="50" textAnchor="middle" className="text-xs fill-green-600 font-bold">91%</text>
            </svg>
          </div>
        </div>
      </div>

      {/* Geographic Impact Map */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3 flex items-center">
          <MapPin className="mr-2 text-red-500" size={20} />
          Geographic Impact Analysis
        </h2>
        <div className="bg-white border border-gray-200 rounded-xl p-4 shadow-lg">
          <div className="mb-3">
            <div className="text-sm font-medium text-gray-700 mb-2">Distribution Centers Affected</div>
            <div className="bg-gray-100 rounded-lg p-3 relative overflow-hidden">
              {/* Simplified US Map Visualization */}
              <svg viewBox="0 0 400 200" className="w-full h-32">
                {/* Background map outline */}
                <rect x="50" y="40" width="300" height="120" fill="#f3f4f6" stroke="#d1d5db" strokeWidth="2" rx="10" />
                
                {/* Distribution Centers */}
                <circle cx="120" cy="80" r="8" fill="#ef4444" className="animate-pulse">
                  <title>DC-12 (Critical)</title>
                </circle>
                <text x="120" y="100" textAnchor="middle" className="text-xs font-bold text-red-600">DC-12</text>
                
                <circle cx="180" cy="70" r="6" fill="#f59e0b">
                  <title>DC-08 (Warning)</title>
                </circle>
                <text x="180" y="90" textAnchor="middle" className="text-xs font-bold text-orange-600">DC-08</text>
                
                <circle cx="240" cy="90" r="6" fill="#eab308">
                  <title>DC-15 (Monitoring)</title>
                </circle>
                <text x="240" y="110" textAnchor="middle" className="text-xs font-bold text-yellow-600">DC-15</text>
                
                <circle cx="280" cy="60" r="4" fill="#16a34a">
                  <title>DC-03 (Normal)</title>
                </circle>
                <text x="280" y="80" textAnchor="middle" className="text-xs font-bold text-green-600">DC-03</text>
                
                <circle cx="160" cy="120" r="4" fill="#16a34a">
                  <title>DC-21 (Normal)</title>
                </circle>
                <text x="160" y="140" textAnchor="middle" className="text-xs font-bold text-green-600">DC-21</text>
                
                {/* Impact radius */}
                <circle cx="120" cy="80" r="25" fill="none" stroke="#ef4444" strokeWidth="2" strokeDasharray="5,5" opacity="0.6" className="animate-ping" />
              </svg>
              
              {/* Legend */}
              <div className="absolute bottom-2 right-2 bg-white rounded-lg p-2 shadow-md text-xs">
                <div className="flex items-center space-x-1 mb-1">
                  <div className="w-2 h-2 bg-red-500 rounded-full"></div>
                  <span>Critical</span>
                </div>
                <div className="flex items-center space-x-1 mb-1">
                  <div className="w-2 h-2 bg-orange-500 rounded-full"></div>
                  <span>Warning</span>
                </div>
                <div className="flex items-center space-x-1">
                  <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                  <span>Normal</span>
                </div>
              </div>
            </div>
          </div>
          
          {/* Impact Stats */}
          <div className="grid grid-cols-3 gap-3 mt-3">
            <div className="bg-red-50 p-3 rounded-lg text-center border border-red-200">
              <div className="text-lg font-bold text-red-600">1</div>
              <div className="text-xs text-red-600">Critical DC</div>
            </div>
            <div className="bg-orange-50 p-3 rounded-lg text-center border border-orange-200">
              <div className="text-lg font-bold text-orange-600">2</div>
              <div className="text-xs text-orange-600">At Risk</div>
            </div>
            <div className="bg-green-50 p-3 rounded-lg text-center border border-green-200">
              <div className="text-lg font-bold text-green-600">47</div>
              <div className="text-xs text-green-600">Operational</div>
            </div>
          </div>
        </div>
      </div>

      {/* Time Series Analysis */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3 flex items-center">
          <Clock className="mr-2 text-blue-500" size={20} />
          Temporal Pattern Analysis
        </h2>
        <div className="bg-white border border-gray-200 rounded-xl p-4 shadow-lg">
          <div className="mb-3">
            <div className="text-sm font-medium text-gray-700 mb-2">24-Hour Incident Timeline</div>
            <div className="relative">
              <svg viewBox="0 0 400 120" className="w-full h-24 border rounded bg-gradient-to-r from-blue-50 to-indigo-50">
                {/* Timeline background */}
                <line x1="40" y1="60" x2="360" y2="60" stroke="#e5e7eb" strokeWidth="2" />
                
                {/* Time markers */}
                {[0, 6, 12, 18, 24].map((hour, i) => (
                  <g key={hour}>
                    <line x1={40 + i * 80} y1="55" x2={40 + i * 80} y2="65" stroke="#9ca3af" strokeWidth="1" />
                    <text x={40 + i * 80} y="80" textAnchor="middle" className="text-xs fill-gray-600">{hour}:00</text>
                  </g>
                ))}
                
                {/* Incident markers */}
                <circle cx="120" cy="60" r="6" fill="#ef4444" className="animate-pulse">
                  <title>Power Outage Start</title>
                </circle>
                <text x="120" y="45" textAnchor="middle" className="text-xs fill-red-600 font-bold">Outage</text>
                
                <circle cx="160" cy="60" r="4" fill="#f59e0b">
                  <title>Temperature Alert</title>
                </circle>
                <text x="160" y="45" textAnchor="middle" className="text-xs fill-orange-600 font-bold">Temp↑</text>
                
                <circle cx="200" cy="60" r="4" fill="#eab308">
                  <title>Spoilage Detected</title>
                </circle>
                <text x="200" y="45" textAnchor="middle" className="text-xs fill-yellow-600 font-bold">Spoil</text>
                
                <circle cx="280" cy="60" r="4" fill="#16a34a">
                  <title>Recovery Started</title>
                </circle>
                <text x="280" y="45" textAnchor="middle" className="text-xs fill-green-600 font-bold">Fix</text>
                
                {/* Impact curve */}
                <path d="M 120 60 Q 150 40, 200 50 Q 230 45, 280 60" stroke="#8b5cf6" strokeWidth="3" fill="none" strokeDasharray="5,5" />
              </svg>
            </div>
          </div>
          
          {/* Key Metrics Timeline */}
          <div className="grid grid-cols-4 gap-2 mt-3 text-xs">
            <div className="bg-red-50 p-2 rounded border border-red-200">
              <div className="font-bold text-red-600">03:15</div>
              <div className="text-red-600">Outage Start</div>
            </div>
            <div className="bg-orange-50 p-2 rounded border border-orange-200">
              <div className="font-bold text-orange-600">04:20</div>
              <div className="text-orange-600">Temp Alert</div>
            </div>
            <div className="bg-yellow-50 p-2 rounded border border-yellow-200">
              <div className="font-bold text-yellow-600">06:45</div>
              <div className="text-yellow-600">Spoilage Det.</div>
            </div>
            <div className="bg-green-50 p-2 rounded border border-green-200">
              <div className="font-bold text-green-600">11:30</div>
              <div className="text-green-600">Recovery</div>
            </div>
          </div>
        </div>
      </div>

      {/* Predictive Model Insights */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3 flex items-center">
          <Brain className="mr-2 text-purple-500" size={20} />
          AI Model Insights
        </h2>
        <div className="space-y-3">
          <div className="bg-white border border-gray-200 rounded-xl p-4 shadow-lg">
            <div className="flex items-center justify-between mb-3">
              <span className="font-medium text-gray-800">Prevention Recommendations</span>
              <div className="text-xs bg-green-100 text-green-700 px-2 py-1 rounded-full">High Priority</div>
            </div>
            <div className="space-y-2">
              <div className="flex items-center space-x-3 p-2 bg-blue-50 rounded-lg">
                <Shield className="text-blue-600" size={16} />
                <div className="flex-1 text-sm">Install backup generators at DC-12</div>
                <div className="text-xs text-blue-600 font-medium">94% effective</div>
              </div>
              <div className="flex items-center space-x-3 p-2 bg-purple-50 rounded-lg">
                <Activity className="text-purple-600" size={16} />
                <div className="flex-1 text-sm">Deploy IoT temperature sensors</div>
                <div className="text-xs text-purple-600 font-medium">87% effective</div>
              </div>
              <div className="flex items-center space-x-3 p-2 bg-green-50 rounded-lg">
                <Target className="text-green-600" size={16} />
                <div className="flex-1 text-sm">Implement predictive maintenance</div>
                <div className="text-xs text-green-600 font-medium">76% effective</div>
              </div>
            </div>
          </div>
          
          <div className="bg-white border border-gray-200 rounded-xl p-4 shadow-lg">
            <div className="flex items-center justify-between mb-3">
              <span className="font-medium text-gray-800">Model Performance</span>
              <div className="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded-full">DoWhy v0.9</div>
            </div>
            <div className="grid grid-cols-3 gap-3">
              <div className="text-center">
                <div className="text-lg font-bold text-green-600">89%</div>
                <div className="text-xs text-gray-600">Accuracy</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-bold text-blue-600">0.23s</div>
                <div className="text-xs text-gray-600">Response</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-bold text-purple-600">47K</div>
                <div className="text-xs text-gray-600">Data Points</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Action Center */}
      <div className="mx-4 mb-4">
        <h2 className="text-lg font-bold mb-3 flex items-center">
          <Zap className="mr-2 text-yellow-500" size={20} />
          Action Center
        </h2>
        <div className="grid grid-cols-2 gap-3">
          <button 
            onClick={() => setCurrentPage('analytics')}
            className="bg-gradient-to-r from-blue-500 to-blue-600 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-200"
          >
            <BarChart3 className="mx-auto mb-2" size={24} />
            <div className="text-sm font-bold">Full Analytics</div>
          </button>
          <button 
            onClick={() => setCurrentPage('smart-refill')}
            className="bg-gradient-to-r from-green-500 to-green-600 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition-all duration-200"
          >
            <Package className="mx-auto mb-2" size={24} />
            <div className="text-sm font-bold">Emergency Refill</div>
          </button>
        </div>
      </div>
    </div>
  );

  // Render current page
  const renderCurrentPage = () => {
    switch (currentPage) {
      case 'dashboard': return <DashboardPage />;
      case 'smart-refill': return <SmartRefillPage />;
      case 'analytics': return <AnalyticsPage />;
      case 'sustainability': return <SustainabilityPage />;
      case 'profile': return <ProfilePage />;
      case 'emotion-cam': return <EmotionCamPage />;
      case 'quantum': return <QuantumPage />;
      case 'zk-proofs': return <ZKProofsPage />;
      case 'ai-coach': return <AiCoachPage />;
      case 'causal-graph': return <CausalGraphPage />;
      default: return <DashboardPage />;
    }
  };

  return (
    <div className="max-w-md mx-auto bg-gray-50 min-h-screen">
      {renderCurrentPage()}
      <TabBar />
    </div>
  );
};

export default WalmartCEDTApp;