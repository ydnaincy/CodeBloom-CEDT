import React, { useState, useEffect } from 'react';
import { 
  ShoppingCart, Home, BarChart3, Leaf, Brain, Zap, 
  Bell, User, Settings, Package, TrendingUp, MapPin,
  Smartphone, Scale, Camera, Coins, Award, ChevronRight,
  Activity, Battery, Wifi, Star, Heart, Search, Filter,
  Calendar, Clock, Globe, Shield, Eye, Lightbulb,
  Target, Truck, Recycle, AlertTriangle, CheckCircle,
  DollarSign, Cpu, Database, LineChart, PieChart,
  BarChart, TrendingDown, Thermometer, Droplets,
  Wind, Sun, Moon, RefreshCw, PlayCircle, PauseCircle,
  Power, Layers, GitBranch, Share2, Download, Upload
} from 'lucide-react';

const CEDTApp = () => {
  const [currentPage, setCurrentPage] = useState('dashboard');
  const [isLoading, setIsLoading] = useState(false);
  const [notifications, setNotifications] = useState(3);
  
  // Real-time metrics
  const [metrics, setMetrics] = useState({
    oatMilkLevel: 85,
    greenCoins: 1247,
    co2Saved: 342,
    energySaved: 18.4,
    costSavings: 156.78,
    wasteReduction: 67,
    efficiency: 94.2,
    predictiveAccuracy: 97.8
  });

  // Live chart data
  const [liveData, setLiveData] = useState({
    consumption: [65, 72, 68, 58, 49, 41, 35, 28, 22, 18],
    emissions: [120, 115, 108, 102, 98, 95, 92, 88, 85, 82],
    costs: [45, 48, 42, 39, 36, 33, 30, 28, 25, 23]
  });

  // Simulate real-time updates
  useEffect(() => {
    const interval = setInterval(() => {
      setMetrics(prev => ({
        ...prev,
        oatMilkLevel: Math.max(0, prev.oatMilkLevel - Math.random() * 0.5),
        co2Saved: prev.co2Saved + Math.random() * 2,
        energySaved: prev.energySaved + Math.random() * 0.1,
        costSavings: prev.costSavings + Math.random() * 5,
        efficiency: Math.min(100, prev.efficiency + (Math.random() - 0.5) * 0.2)
      }));

      setLiveData(prev => ({
        consumption: [...prev.consumption.slice(1), Math.random() * 80 + 20],
        emissions: [...prev.emissions.slice(1), Math.random() * 40 + 80],
        costs: [...prev.costs.slice(1), Math.random() * 30 + 20]
      }));
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  const WalmartHeader = ({ title, showBack = false }) => (
    <div className="bg-gradient-to-r from-blue-600 to-blue-800 text-white p-4 shadow-lg">
      <div className="flex justify-between items-center">
        <div className="flex items-center space-x-3">
          {showBack && (
            <button onClick={() => setCurrentPage('dashboard')} className="p-1">
              <ChevronRight className="rotate-180" size={20} />
            </button>
          )}
          <div className="w-10 h-10 bg-yellow-400 rounded-full flex items-center justify-center shadow-md">
            <span className="text-blue-700 font-bold text-lg">W</span>
          </div>
          <div>
            <h1 className="text-xl font-bold">CEDT</h1>
            <p className="text-blue-200 text-xs">{title}</p>
          </div>
        </div>
        <div className="flex items-center space-x-3">
          <div className="relative">
            <Bell size={20} className="text-white" />
            {notifications > 0 && (
              <div className="absolute -top-1 -right-1 bg-red-500 rounded-full w-4 h-4 flex items-center justify-center">
                <span className="text-xs font-bold">{notifications}</span>
              </div>
            )}
          </div>
          <div className="flex items-center space-x-1 text-blue-200">
            <Wifi size={16} />
            <Battery size={16} />
          </div>
        </div>
      </div>
    </div>
  );

  const LiveMetricCard = ({ icon: Icon, title, value, unit, change, color, trend }) => (
    <div className="bg-white rounded-xl p-4 shadow-lg border border-gray-100">
      <div className="flex items-center justify-between mb-2">
        <Icon className={`text-${color}-600`} size={24} />
        <div className={`flex items-center space-x-1 text-sm ${
          trend > 0 ? 'text-green-600' : 'text-red-600'
        }`}>
          {trend > 0 ? <TrendingUp size={14} /> : <TrendingDown size={14} />}
          <span className="font-medium">{Math.abs(change)}%</span>
        </div>
      </div>
      <div className="space-y-1">
        <div className="text-2xl font-bold text-gray-800">{value}</div>
        <div className="text-sm text-gray-600">{unit}</div>
        <div className="text-xs text-gray-500">{title}</div>
      </div>
    </div>
  );

  const MiniChart = ({ data, color, height = 40 }) => (
    <div className="flex items-end space-x-1" style={{ height }}>
      {data.slice(-10).map((value, index) => (
        <div
          key={index}
          className={`bg-${color}-500 w-2 rounded-t transition-all duration-300`}
          style={{ height: `${(value / Math.max(...data)) * height}px` }}
        />
      ))}
    </div>
  );

  const DashboardPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Circular Economy Digital Twin" />
      
      {/* Hero Stats */}
      <div className="p-4 grid grid-cols-2 gap-4">
        <LiveMetricCard
          icon={Leaf}
          title="CO₂ Reduction"
          value={metrics.co2Saved.toFixed(0)}
          unit="kg saved"
          change={12.5}
          color="green"
          trend={1}
        />
        <LiveMetricCard
          icon={DollarSign}
          title="Cost Savings"
          value={`$${metrics.costSavings.toFixed(0)}`}
          unit="this month"
          change={8.3}
          color="blue"
          trend={1}
        />
        <LiveMetricCard
          icon={Zap}
          title="Energy Efficiency"
          value={`${metrics.energySaved.toFixed(1)}`}
          unit="kWh saved"
          change={15.2}
          color="yellow"
          trend={1}
        />
        <LiveMetricCard
          icon={Target}
          title="AI Accuracy"
          value={`${metrics.predictiveAccuracy.toFixed(1)}%`}
          unit="prediction rate"
          change={2.1}
          color="purple"
          trend={1}
        />
      </div>

      {/* Live Consumption Chart */}
      <div className="mx-4 mb-4">
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-bold text-gray-800">Live Consumption</h3>
            <div className="flex items-center space-x-2">
              <div className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
              <span className="text-xs text-gray-500">Real-time</span>
            </div>
          </div>
          <div className="h-32 flex items-end justify-between">
            {liveData.consumption.map((value, index) => (
              <div key={index} className="flex flex-col items-center space-y-1">
                <div
                  className="bg-gradient-to-t from-blue-500 to-blue-300 w-6 rounded-t transition-all duration-500"
                  style={{ height: `${(value / 100) * 100}px` }}
                />
                <span className="text-xs text-gray-400">
                  {index < 5 ? `${10-index}h` : `${index-4}h`}
                </span>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Smart Alerts */}
      <div className="mx-4 mb-4">
        <div className="bg-gradient-to-r from-orange-100 to-red-100 border border-orange-200 rounded-xl p-4">
          <div className="flex items-center space-x-3 mb-3">
            <AlertTriangle className="text-orange-600" size={24} />
            <div>
              <h3 className="font-bold text-orange-800">Smart Prediction Alert</h3>
              <p className="text-sm text-orange-600">Oat milk inventory critical</p>
            </div>
          </div>
          <div className="bg-white rounded-lg p-3 mb-3">
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm font-medium">Stock Level</span>
              <span className="text-sm text-orange-600">{metrics.oatMilkLevel.toFixed(1)}%</span>
            </div>
            <div className="w-full h-2 bg-gray-200 rounded-full">
              <div
                className={`h-2 rounded-full transition-all duration-500 ${
                  metrics.oatMilkLevel > 50 ? 'bg-green-500' : 
                  metrics.oatMilkLevel > 20 ? 'bg-yellow-500' : 'bg-red-500'
                }`}
                style={{ width: `${metrics.oatMilkLevel}%` }}
              />
            </div>
            <p className="text-xs text-gray-600 mt-2">
              Predicted stockout: July 16, 2025 (AI Confidence: 94.7%)
            </p>
          </div>
          <div className="flex space-x-2">
            <button 
              onClick={() => setCurrentPage('smart-refill')}
              className="flex-1 bg-green-600 text-white py-2 px-4 rounded-lg text-sm font-medium"
            >
              Auto-Refill
            </button>
            <button className="flex-1 bg-white border border-orange-300 text-orange-700 py-2 px-4 rounded-lg text-sm font-medium">
              Optimize Route
            </button>
          </div>
        </div>
      </div>

      {/* AI Insights */}
      <div className="mx-4 mb-4">
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <div className="flex items-center space-x-3 mb-4">
            <Brain className="text-purple-600" size={24} />
            <h3 className="text-lg font-bold text-gray-800">AI-Powered Insights</h3>
          </div>
          <div className="space-y-3">
            <div className="bg-purple-50 border border-purple-200 rounded-lg p-3">
              <div className="flex items-start space-x-2">
                <Lightbulb className="text-purple-600 mt-1" size={16} />
                <div>
                  <p className="text-sm font-medium text-purple-800">
                    Switch to local suppliers for 23% carbon reduction
                  </p>
                  <p className="text-xs text-purple-600 mt-1">
                    Impact: High • Confidence: 89% • ROI: $2,340/month
                  </p>
                </div>
              </div>
            </div>
            <div className="bg-green-50 border border-green-200 rounded-lg p-3">
              <div className="flex items-start space-x-2">
                <Target className="text-green-600 mt-1" size={16} />
                <div>
                  <p className="text-sm font-medium text-green-800">
                    Optimize delivery routes using quantum algorithms
                  </p>
                  <p className="text-xs text-green-600 mt-1">
                    Potential savings: 156 kg CO₂ • Est. completion: 2 days
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Quick Actions Grid */}
      <div className="mx-4 mb-4">
        <h3 className="text-lg font-bold text-gray-800 mb-3">Quick Actions</h3>
        <div className="grid grid-cols-2 gap-3">
          {[
            { icon: BarChart3, label: 'Live Analytics', page: 'analytics', gradient: 'from-blue-500 to-blue-600' },
            { icon: Truck, label: 'Supply Chain', page: 'supply-chain', gradient: 'from-green-500 to-green-600' },
            { icon: Camera, label: 'Emotion AI', page: 'emotion-cam', gradient: 'from-pink-500 to-pink-600' },
            { icon: Shield, label: 'ZK Proofs', page: 'zk-proofs', gradient: 'from-purple-500 to-purple-600' }
          ].map(action => (
            <button
              key={action.page}
              onClick={() => setCurrentPage(action.page)}
              className={`bg-gradient-to-r ${action.gradient} text-white rounded-xl p-4 shadow-lg transform transition-all duration-200 active:scale-95`}
            >
              <action.icon size={28} className="mx-auto mb-2" />
              <span className="text-sm font-medium">{action.label}</span>
            </button>
          ))}
        </div>
      </div>
    </div>
  );

  const AnalyticsPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Advanced Analytics Dashboard" showBack />
      
      {/* Real-time Performance Metrics */}
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-bold text-gray-800">Live Performance Metrics</h3>
            <div className="flex items-center space-x-2">
              <div className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
              <span className="text-xs text-gray-500">Real-time</span>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-4">
            <div className="text-center">
              <div className="text-3xl font-bold text-blue-600">{metrics.efficiency.toFixed(1)}%</div>
              <div className="text-sm text-gray-600">Overall Efficiency</div>
              <div className="w-full h-3 bg-gray-200 rounded-full mt-2">
                <div 
                  className="h-3 bg-gradient-to-r from-blue-500 to-blue-600 rounded-full transition-all duration-1000"
                  style={{ width: `${metrics.efficiency}%` }}
                ></div>
              </div>
            </div>
            <div className="text-center">
              <div className="text-3xl font-bold text-green-600">4.2M</div>
              <div className="text-sm text-gray-600">Routes Optimized</div>
              <div className="flex justify-center mt-2">
                <MiniChart data={liveData.consumption} color="green" height={30} />
              </div>
            </div>
          </div>
        </div>

        {/* Advanced Multi-Chart Dashboard */}
        <div className="space-y-4">
          {/* Multi-dimensional Performance Chart */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <div className="flex items-center justify-between mb-4">
              <h4 className="font-bold text-gray-800">Multi-Dimensional Analysis</h4>
              <div className="flex space-x-2">
                <button className="px-3 py-1 bg-blue-100 text-blue-600 rounded-full text-xs">Cost</button>
                <button className="px-3 py-1 bg-green-100 text-green-600 rounded-full text-xs">CO₂</button>
                <button className="px-3 py-1 bg-purple-100 text-purple-600 rounded-full text-xs">Efficiency</button>
              </div>
            </div>
            <div className="h-40 relative">
              <div className="absolute inset-0 flex items-end justify-between">
                {liveData.emissions.map((value, index) => (
                  <div key={index} className="flex flex-col items-center space-y-1 flex-1">
                    {/* Cost Bar */}
                    <div className="w-full flex space-x-1">
                      <div
                        className="bg-blue-500 opacity-80 rounded-t transition-all duration-500"
                        style={{ 
                          height: `${(liveData.costs[index] / Math.max(...liveData.costs)) * 120}px`,
                          width: '6px'
                        }}
                      />
                      {/* Emissions Bar */}
                      <div
                        className="bg-green-500 opacity-80 rounded-t transition-all duration-500"
                        style={{ 
                          height: `${(value / Math.max(...liveData.emissions)) * 120}px`,
                          width: '6px'
                        }}
                      />
                      {/* Consumption Bar */}
                      <div
                        className="bg-purple-500 opacity-80 rounded-t transition-all duration-500"
                        style={{ 
                          height: `${(liveData.consumption[index] / Math.max(...liveData.consumption)) * 120}px`,
                          width: '6px'
                        }}
                      />
                    </div>
                    <span className="text-xs text-gray-400">
                      {index % 2 === 0 ? `T${index + 1}` : ''}
                    </span>
                  </div>
                ))}
              </div>
            </div>
            <div className="flex justify-center space-x-6 mt-4 text-xs">
              <div className="flex items-center space-x-2">
                <div className="w-3 h-3 bg-blue-500 rounded"></div>
                <span>Cost</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-3 h-3 bg-green-500 rounded"></div>
                <span>Emissions</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-3 h-3 bg-purple-500 rounded"></div>
                <span>Consumption</span>
              </div>
            </div>
          </div>

          {/* SHAP Values Explainability */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <div className="flex items-center space-x-3 mb-4">
              <Brain className="text-purple-600" size={24} />
              <h4 className="font-bold text-gray-800">SHAP Values - AI Explainability</h4>
            </div>
            <div className="bg-purple-50 border border-purple-200 rounded-lg p-3 mb-4">
              <div className="text-sm font-medium text-purple-800 mb-2">
                Model: XGBoost Demand Prediction | SHAP Score: 0.847
              </div>
              <div className="text-xs text-purple-600">
                Feature importance analysis for inventory optimization decisions
              </div>
            </div>
            <div className="space-y-3">
              {[
                { feature: 'Temperature (°C)', impact: 0.34, direction: 'negative', value: '22.5°C' },
                { feature: 'Day of Week', impact: 0.28, direction: 'positive', value: 'Monday' },
                { feature: 'Stock Level (%)', impact: 0.19, direction: 'negative', value: '85%' },
                { feature: 'Historical Demand', impact: 0.12, direction: 'positive', value: '847 units' },
                { feature: 'Supplier Distance', impact: 0.07, direction: 'negative', value: '2.3 miles' }
              ].map((item, index) => (
                <div key={index} className="flex items-center space-x-3">
                  <div className="w-24 text-sm text-gray-600 truncate">{item.feature}</div>
                  <div className="flex-1 flex items-center space-x-2">
                    <div className="flex-1 h-4 bg-gray-200 rounded-full relative">
                      <div
                        className={`h-4 rounded-full transition-all duration-1000 ${
                          item.direction === 'positive' ? 'bg-green-500' : 'bg-red-500'
                        }`}
                        style={{ width: `${item.impact * 100}%` }}
                      />
                      <div className="absolute inset-0 flex items-center justify-center">
                        <span className="text-xs text-white font-medium">{item.impact.toFixed(2)}</span>
                      </div>
                    </div>
                    <div className="w-16 text-xs text-gray-500">{item.value}</div>
                  </div>
                  <div className={`w-2 h-2 rounded-full ${
                    item.direction === 'positive' ? 'bg-green-500' : 'bg-red-500'
                  }`}></div>
                </div>
              ))}
            </div>
          </div>

          {/* Correlation Heatmap */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <h4 className="font-bold text-gray-800 mb-4">Feature Correlation Matrix</h4>
            <div className="grid grid-cols-5 gap-1 text-xs">
              {/* Header Row */}
              <div></div>
              <div className="text-center text-gray-600 rotate-45 transform origin-center">Temp</div>
              <div className="text-center text-gray-600 rotate-45 transform origin-center">Stock</div>
              <div className="text-center text-gray-600 rotate-45 transform origin-center">Demand</div>
              <div className="text-center text-gray-600 rotate-45 transform origin-center">Distance</div>
              
              {/* Data Rows */}
              {[
                { label: 'Temp', values: [1.0, -0.65, 0.43, -0.12] },
                { label: 'Stock', values: [-0.65, 1.0, -0.78, 0.34] },
                { label: 'Demand', values: [0.43, -0.78, 1.0, -0.23] },
                { label: 'Distance', values: [-0.12, 0.34, -0.23, 1.0] }
              ].map((row, i) => (
                <React.Fragment key={i}>
                  <div className="text-gray-600">{row.label}</div>
                  {row.values.map((val, j) => (
                    <div
                      key={j}
                      className={`h-8 flex items-center justify-center text-white text-xs font-medium rounded ${
                        Math.abs(val) > 0.7 ? 'bg-red-600' :
                        Math.abs(val) > 0.4 ? 'bg-orange-500' :
                        Math.abs(val) > 0.2 ? 'bg-yellow-500' : 'bg-green-500'
                      }`}
                    >
                      {val.toFixed(2)}
                    </div>
                  ))}
                </React.Fragment>
              ))}
            </div>
          </div>

          {/* Advanced Time Series Decomposition */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <h4 className="font-bold text-gray-800 mb-4">Time Series Decomposition</h4>
            <div className="space-y-4">
              {/* Trend Component */}
              <div>
                <div className="text-sm font-medium text-gray-700 mb-2">Trend Component</div>
                <div className="h-16 flex items-end space-x-1">
                  {[45, 47, 48, 50, 52, 51, 53, 55, 54, 56].map((value, index) => (
                    <div
                      key={index}
                      className="bg-blue-500 w-full rounded-t transition-all duration-500"
                      style={{ height: `${(value / 60) * 100}%` }}
                    />
                  ))}
                </div>
              </div>
              
              {/* Seasonal Component */}
              <div>
                <div className="text-sm font-medium text-gray-700 mb-2">Seasonal Component</div>
                <div className="h-16 flex items-center space-x-1">
                  {[2, -1, 3, -2, 4, -1, 2, -3, 1, -2].map((value, index) => (
                    <div
                      key={index}
                      className={`w-full rounded transition-all duration-500 ${
                        value > 0 ? 'bg-green-500' : 'bg-red-500'
                      }`}
                      style={{ 
                        height: `${Math.abs(value) * 8}px`,
                        marginTop: value < 0 ? `${32 - Math.abs(value) * 8}px` : 'auto',
                        marginBottom: value > 0 ? `${32 - Math.abs(value) * 8}px` : 'auto'
                      }}
                    />
                  ))}
                </div>
              </div>
              
              {/* Residual Component */}
              <div>
                <div className="text-sm font-medium text-gray-700 mb-2">Residual Component</div>
                <div className="h-16 flex items-center space-x-1">
                  {[0.5, -0.3, 0.8, -0.2, 0.1, -0.6, 0.4, -0.1, 0.7, -0.4].map((value, index) => (
                    <div
                      key={index}
                      className={`w-full rounded transition-all duration-500 ${
                        value > 0 ? 'bg-purple-500' : 'bg-orange-500'
                      }`}
                      style={{ 
                        height: `${Math.abs(value) * 20}px`,
                        marginTop: value < 0 ? `${32 - Math.abs(value) * 20}px` : 'auto',
                        marginBottom: value > 0 ? `${32 - Math.abs(value) * 20}px` : 'auto'
                      }}
                    />
                  ))}
                </div>
              </div>
            </div>
          </div>

          {/* Quantum Processing Performance */}
          <div className="bg-gradient-to-r from-indigo-100 to-purple-100 rounded-xl p-4">
            <div className="flex items-center space-x-3 mb-4">
              <Cpu className="text-indigo-600" size={24} />
              <h4 className="font-bold text-indigo-800">Quantum Processing Analytics</h4>
            </div>
            <div className="grid grid-cols-2 gap-4 mb-4">
              <div className="bg-white bg-opacity-50 rounded-lg p-3">
                <div className="text-center">
                  <div className="text-2xl font-bold text-indigo-700">1.3s</div>
                  <div className="text-xs text-indigo-600">Processing Time</div>
                </div>
                <div className="mt-2 h-2 bg-indigo-200 rounded-full">
                  <div className="h-2 bg-indigo-600 rounded-full w-4/5 animate-pulse"></div>
                </div>
              </div>
              <div className="bg-white bg-opacity-50 rounded-lg p-3">
                <div className="text-center">
                  <div className="text-2xl font-bold text-indigo-700">2048</div>
                  <div className="text-xs text-indigo-600">Qubits Utilized</div>
                </div>
                <div className="mt-2 h-2 bg-indigo-200 rounded-full">
                  <div className="h-2 bg-indigo-600 rounded-full w-full"></div>
                </div>
              </div>
            </div>
            <div className="grid grid-cols-3 gap-3 text-center text-sm">
              <div>
                <div className="font-bold text-indigo-700">99.7%</div>
                <div className="text-indigo-600 text-xs">Accuracy</div>
              </div>
              <div>
                <div className="font-bold text-indigo-700">36%</div>
                <div className="text-indigo-600 text-xs">Fuel Saved</div>
              </div>
              <div>
                <div className="font-bold text-indigo-700">23%</div>
                <div className="text-indigo-600 text-xs">Cost Reduction</div>
              </div>
            </div>
          </div>

          {/* Enhanced Model Performance */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <h4 className="font-bold text-gray-800 mb-4">AI Model Performance Dashboard</h4>
            <div className="space-y-4">
              {[
                { model: 'SARIMAX Demand', accuracy: 94.7, mae: 2.3, rmse: 4.1, trend: 'up', color: 'green' },
                { model: 'Deep Learning Route', accuracy: 97.2, mae: 1.8, rmse: 3.2, trend: 'up', color: 'blue' },
                { model: 'Random Forest Price', accuracy: 91.8, mae: 3.1, rmse: 5.4, trend: 'stable', color: 'yellow' },
                { model: 'LSTM Consumption', accuracy: 96.1, mae: 2.0, rmse: 3.8, trend: 'up', color: 'purple' }
              ].map(model => (
                <div key={model.model} className={`border-l-4 border-${model.color}-500 bg-${model.color}-50 p-3 rounded-r-lg`}>
                  <div className="flex items-center justify-between mb-2">
                    <span className="font-medium text-gray-800">{model.model}</span>
                    <div className="flex items-center space-x-2">
                      {model.trend === 'up' ? 
                        <TrendingUp className={`text-${model.color}-600`} size={16} /> : 
                        <Activity className={`text-${model.color}-600`} size={16} />
                      }
                    </div>
                  </div>
                  <div className="grid grid-cols-3 gap-4 text-sm">
                    <div>
                      <div className={`font-bold text-${model.color}-700`}>{model.accuracy}%</div>
                      <div className="text-gray-600 text-xs">Accuracy</div>
                    </div>
                    <div>
                      <div className={`font-bold text-${model.color}-700`}>{model.mae}</div>
                      <div className="text-gray-600 text-xs">MAE</div>
                    </div>
                    <div>
                      <div className={`font-bold text-${model.color}-700`}>{model.rmse}</div>
                      <div className="text-gray-600 text-xs">RMSE</div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Real-time Anomaly Detection */}
          <div className="bg-white rounded-xl p-4 shadow-lg">
            <div className="flex items-center space-x-3 mb-4">
              <AlertTriangle className="text-red-600" size={24} />
              <h4 className="font-bold text-gray-800">Anomaly Detection</h4>
            </div>
            <div className="space-y-3">
              <div className="bg-red-50 border border-red-200 rounded-lg p-3">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-medium text-red-800">Temperature Spike Detected</span>
                  <span className="text-xs text-red-600">Confidence: 94.2%</span>
                </div>
                <div className="text-sm text-red-700">
                  Anomalous temperature reading: 28.7°C (Expected: 22.5°C ± 1.2°C)
                </div>
                <div className="mt-2 h-2 bg-red-200 rounded-full">
                  <div className="h-2 bg-red-600 rounded-full w-5/6"></div>
                </div>
              </div>
              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-3">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-medium text-yellow-800">Demand Pattern Shift</span>
                  <span className="text-xs text-yellow-600">Confidence: 87.1%</span>
                </div>
                <div className="text-sm text-yellow-700">
                  Unusual demand pattern detected for oat milk category
                </div>
                <div className="mt-2 h-2 bg-yellow-200 rounded-full">
                  <div className="h-2 bg-yellow-600 rounded-full w-4/5"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const SmartRefillPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Smart Refill Intelligence" showBack />
      
      {/* IoT Device Network */}
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">IoT Device Network</h3>
          <div className="space-y-3">
            <div className="bg-green-50 border border-green-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center space-x-3">
                  <Scale className="text-green-600" size={20} />
                  <div>
                    <div className="font-medium text-green-800">Smart Scale #001</div>
                    <div className="text-sm text-green-600">Kitchen Counter • Active</div>
                  </div>
                </div>
                <div className="flex items-center space-x-2">
                  <div className="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                  <Wifi className="text-green-600" size={16} />
                </div>
              </div>
              <div className="bg-white rounded p-2">
                <div className="flex justify-between text-sm mb-1">
                  <span>Oat Milk Level</span>
                  <span className="font-medium">{metrics.oatMilkLevel.toFixed(1)}%</span>
                </div>
                <div className="w-full h-2 bg-gray-200 rounded-full">
                  <div
                    className="h-2 bg-green-500 rounded-full transition-all duration-500"
                    style={{ width: `${metrics.oatMilkLevel}%` }}
                  />
                </div>
              </div>
            </div>

            <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center space-x-3">
                  <Thermometer className="text-blue-600" size={20} />
                  <div>
                    <div className="font-medium text-blue-800">Temperature Sensor</div>
                    <div className="text-sm text-blue-600">Refrigerator • Monitoring</div>
                  </div>
                </div>
                <div className="text-right">
                  <div className="text-lg font-bold text-blue-700">3.2°C</div>
                  <div className="text-xs text-blue-600">Optimal Range</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Predictive Analytics */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">SARIMAX Predictions</h3>
          <div className="bg-orange-50 border border-orange-200 rounded-lg p-3 mb-3">
            <div className="flex items-center space-x-2 mb-2">
              <AlertTriangle className="text-orange-600" size={16} />
              <span className="font-medium text-orange-800">Critical Prediction</span>
            </div>
            <p className="text-sm text-orange-700">
              Stock depletion predicted for July 16, 2025 at 14:30 GMT
            </p>
            <p className="text-xs text-orange-600 mt-1">
              Model: SARIMAX(2,1,2) • Confidence: 94.7% • MAE: 2.3%
            </p>
          </div>
          
          <div className="h-40 mb-3">
            <div className="text-sm text-gray-600 mb-2">7-Day Consumption Forecast</div>
            <div className="flex items-end h-32 space-x-1">
              {[85, 72, 58, 42, 28, 16, 8, 3, 1, 0].map((level, index) => (
                <div key={index} className="flex-1 flex flex-col items-center">
                  <div
                    className={`w-full rounded-t transition-all duration-1000 ${
                      level > 50 ? 'bg-green-500' : level > 20 ? 'bg-yellow-500' : 'bg-red-500'
                    }`}
                    style={{ height: `${level}%` }}
                  />
                  <span className="text-xs text-gray-500 mt-1">
                    {index === 0 ? 'Now' : `+${index}d`}
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Optimized Refill Options */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Eco-Optimized Solutions</h3>
          <div className="space-y-3">
            <div className="bg-green-50 border-2 border-green-300 rounded-lg p-4">
              <div className="flex justify-between items-start mb-3">
                <div className="flex items-center space-x-3">
                  <Award className="text-green-600" size={20} />
                  <div>
                    <div className="font-bold text-green-800">Local Farm Co-op</div>
                    <div className="text-sm text-green-600">2.3 miles • Organic certified</div>
                  </div>
                </div>
                <div className="text-right">
                  <div className="text-lg font-bold text-green-700">$4.99</div>
                  <div className="text-xs text-green-600">Best eco choice</div>
                </div>
              </div>
              <div className="grid grid-cols-3 gap-3 text-center mb-3">
                <div>
                  <div className="text-sm font-bold text-green-700">A+</div>
                  <div className="text-xs text-green-600">Eco Score</div>
                </div>
                <div>
                  <div className="text-sm font-bold text-green-700">220g</div>
                  <div className="text-xs text-green-600">CO₂ Saved</div>
                </div>
                <div>
                  <div className="text-sm font-bold text-green-700">45</div>
                  <div className="text-xs text-green-600">GreenCoins</div>
                </div>
              </div>
              <button className="w-full bg-green-600 text-white py-3 rounded-lg font-medium">
                Select & Auto-Schedule
              </button>
            </div>

            <div className="bg-white border border-gray-300 rounded-lg p-4">
              <div className="flex justify-between items-start mb-3">
                <div className="flex items-center space-x-3">
                  <Package className="text-blue-600" size={20} />
                  <div>
                    <div className="font-bold text-gray-800">Walmart Supercenter</div>
                    <div className="text-sm text-gray-600">5.7 miles • Same-day delivery</div>
                  </div>
                </div>
                <div className="text-right">
                  <div className="text-lg font-bold text-gray-700">$3.97</div>
                  <div className="text-xs text-gray-600">Fastest option</div>
                </div>
              </div>
              <div className="grid grid-cols-3 gap-3 text-center mb-3">
                <div>
                  <div className="text-sm font-bold text-yellow-600">B+</div>
                  <div className="text-xs text-gray-600">Eco Score</div>
                </div>
                <div>
                  <div className="text-sm font-bold text-gray-700">140g</div>
                  <div className="text-xs text-gray-600">CO₂ Saved</div>
                </div>
                <div>
                  <div className="text-sm font-bold text-gray-700">25</div>
                  <div className="text-xs text-gray-600">GreenCoins</div>
                </div>
              </div>
              <button className="w-full bg-blue-600 text-white py-3 rounded-lg font-medium">
                Select Standard Delivery
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const SupplyChainPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Supply Chain Intelligence" showBack />
      
      {/* Real-time Network Status */}
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Network Status</h3>
          <div className="grid grid-cols-2 gap-4">
            <div className="bg-green-50 rounded-lg p-3 text-center">
              <Truck className="text-green-600 mx-auto mb-2" size={24} />
              <div className="text-xl font-bold text-green-700">247</div>
              <div className="text-sm text-green-600">Active Vehicles</div>
              <div className="text-xs text-green-500 mt-1">97.2% on-time</div>
            </div>
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <Database className="text-blue-600 mx-auto mb-2" size={24} />
              <div className="text-xl font-bold text-blue-700">156</div>
              <div className="text-sm text-blue-600">Distribution Centers</div>
              <div className="text-xs text-blue-500 mt-1">99.1% operational</div>
            </div>
          </div>
        </div>

        {/* Route Optimization */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="flex items-center space-x-3 mb-4">
            <GitBranch className="text-purple-600" size={24} />
            <h3 className="text-lg font-bold text-gray-800">Quantum Route Optimization</h3>
          </div>
          <div className="bg-purple-50 border border-purple-200 rounded-lg p-3 mb-3">
            <div className="text-center mb-3">
              <div className="text-2xl font-bold text-purple-700">4.2M</div>
              <div className="text-sm text-purple-600">Routes analyzed in 1.3 seconds</div>
            </div>
            <div className="grid grid-cols-3 gap-3 text-center text-sm">
              <div>
                <div className="font-bold text-purple-700">36%</div>
                <div className="text-purple-600">Fuel Saved</div>
              </div>
              <div>
                <div className="font-bold text-purple-700">23%</div>
                <div className="text-purple-600">Cost Reduction</div>
              </div>
              <div>
                <div className="font-bold text-purple-700">1.8kg</div>
                <div className="text-purple-600">CO₂ per mile</div>
              </div>
            </div>
          </div>
          <div className="flex items-center justify-between p-2 bg-gray-50 rounded">
            <span className="text-sm text-gray-600">Current Algorithm</span>
            <span className="text-sm font-medium text-purple-600">QUBO + Reinforcement Learning</span>
          </div>
        </div>

        {/* Live Tracking */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Live Vehicle Tracking</h3>
          <div className="space-y-3">
            {[
              { id: 'TRK-001', location: 'Austin, TX', eta: '14:30', status: 'on-time', progress: 75 },
              { id: 'TRK-087', location: 'Dallas, TX', eta: '16:45', status: 'delayed', progress: 45 },
              { id: 'TRK-156', location: 'Houston, TX', eta: '12:15', status: 'early', progress: 90 }
            ].map(truck => (
              <div key={truck.id} className="border border-gray-200 rounded-lg p-3">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center space-x-3">
                    <Truck className="text-blue-600" size={20} />
                    <div>
                      <div className="font-medium text-gray-800">{truck.id}</div>
                      <div className="text-sm text-gray-600">{truck.location}</div>
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="text-sm font-medium">ETA: {truck.eta}</div>
                    <div className={`text-xs ${
                      truck.status === 'on-time' ? 'text-green-600' : 
                      truck.status === 'early' ? 'text-blue-600' : 'text-red-600'
                    }`}>
                      {truck.status}
                    </div>
                  </div>
                </div>
                <div className="w-full h-2 bg-gray-200 rounded-full">
                  <div
                    className={`h-2 rounded-full ${
                      truck.status === 'on-time' ? 'bg-green-500' : 
                      truck.status === 'early' ? 'bg-blue-500' : 'bg-red-500'
                    }`}
                    style={{ width: `${truck.progress}%` }}
                  />
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Causal Analysis */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <div className="flex items-center space-x-3 mb-4">
            <Activity className="text-red-600" size={24} />
            <h3 className="text-lg font-bold text-gray-800">Causal Analysis</h3>
          </div>
          <div className="bg-red-50 border border-red-200 rounded-lg p-3 mb-3">
            <div className="flex items-center space-x-2 mb-2">
              <AlertTriangle className="text-red-600" size={16} />
              <span className="font-medium text-red-800">Root Cause Detected</span>
            </div>
            <p className="text-sm text-red-700 mb-2">
              23% waste increase → Power outage in DC-12 → Temperature spike
            </p>
            <div className="text-xs text-red-600">
              Confidence: 89% | Impact: High | Estimated loss: $12,400
            </div>
          </div>
          <button 
            onClick={() => setCurrentPage('causal-graph')}
            className="w-full bg-red-600 text-white py-2 rounded-lg text-sm font-medium"
          >
            View Detailed Causal Graph
          </button>
        </div>
      </div>
    </div>
  );

  const SustainabilityPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Sustainability Impact Dashboard" showBack />
      
      {/* Carbon Impact Overview */}
      <div className="p-4">
        <div className="bg-gradient-to-r from-green-500 to-green-600 rounded-xl p-4 text-white mb-4">
          <div className="text-center mb-4">
            <Leaf className="mx-auto mb-2" size={32} />
            <div className="text-3xl font-bold">{metrics.co2Saved.toFixed(0)}kg</div>
            <div className="text-green-100">CO₂ Saved This Month</div>
          </div>
          <div className="grid grid-cols-3 gap-4 text-center">
            <div>
              <div className="text-xl font-bold">36%</div>
              <div className="text-xs text-green-100">Reduction</div>
            </div>
            <div>
              <div className="text-xl font-bold">15.2kg</div>
              <div className="text-xs text-green-100">Total Saved</div>
            </div>
            <div>
              <div className="text-xl font-bold">A+</div>
              <div className="text-xs text-green-100">Eco Rating</div>
            </div>
          </div>
        </div>

        {/* Zero-Knowledge Proofs */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="flex items-center space-x-3 mb-4">
            <Shield className="text-purple-600" size={24} />
            <h3 className="text-lg font-bold text-gray-800">Verified Impact</h3>
          </div>
          <div className="bg-purple-50 border border-purple-200 rounded-lg p-3 mb-3">
            <div className="flex items-center justify-between mb-2">
              <span className="font-medium text-purple-800">ZK-SNARK Verified</span>
              <CheckCircle className="text-purple-600" size={20} />
            </div>
            <p className="text-sm text-purple-700 mb-2">
              Your sustainability claims are cryptographically verified on Polygon testnet
            </p>
            <div className="text-xs text-purple-600">
              Latest proof: 0x7f4a9c...8b2e1d • Block #47829156
            </div>
          </div>
          <button 
            onClick={() => setCurrentPage('zk-proofs')}
            className="w-full bg-purple-600 text-white py-3 rounded-lg font-medium"
          >
            View Proof Details
          </button>
        </div>

        {/* GreenCoins Wallet */}
        <div className="bg-gradient-to-r from-yellow-400 to-yellow-500 rounded-xl p-4 text-white mb-4">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center space-x-3">
              <Coins size={24} />
              <div>
                <div className="text-xl font-bold">{metrics.greenCoins}</div>
                <div className="text-yellow-100 text-sm">GreenCoins Balance</div>
              </div>
            </div>
            <div className="text-right">
              <div className="text-lg font-bold">+127</div>
              <div className="text-yellow-100 text-xs">This week</div>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-2">
            <button className="bg-white text-yellow-600 py-2 rounded-lg text-sm font-medium">
              Redeem Rewards
            </button>
            <button className="bg-yellow-600 text-white py-2 rounded-lg text-sm font-medium">
              Earn More
            </button>
          </div>
        </div>

        {/* Circular Economy Goals */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Circular Economy Progress</h3>
          <div className="space-y-4">
            {[
              { goal: 'Zero Food Waste', progress: 78, target: 90, icon: Recycle, color: 'green' },
              { goal: 'Local Sourcing', progress: 65, target: 75, icon: MapPin, color: 'blue' },
              { goal: 'Packaging Reduction', progress: 82, target: 85, icon: Package, color: 'purple' },
              { goal: 'Renewable Energy', progress: 91, target: 95, icon: Sun, color: 'yellow' }
            ].map(item => (
              <div key={item.goal} className="border border-gray-200 rounded-lg p-3">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center space-x-3">
                    <item.icon className={`text-${item.color}-600`} size={20} />
                    <span className="font-medium text-gray-800">{item.goal}</span>
                  </div>
                  <span className="text-sm font-bold text-gray-800">{item.progress}%</span>
                </div>
                <div className="w-full h-3 bg-gray-200 rounded-full">
                  <div
                    className={`h-3 bg-${item.color}-500 rounded-full transition-all duration-1000`}
                    style={{ width: `${item.progress}%` }}
                  />
                </div>
                <div className="flex justify-between text-xs text-gray-500 mt-1">
                  <span>Current: {item.progress}%</span>
                  <span>Target: {item.target}%</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Environmental Impact */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Environmental Impact</h3>
          <div className="grid grid-cols-2 gap-4">
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <Droplets className="text-blue-600 mx-auto mb-2" size={20} />
              <div className="text-lg font-bold text-blue-700">2,847L</div>
              <div className="text-sm text-blue-600">Water Saved</div>
            </div>
            <div className="bg-green-50 rounded-lg p-3 text-center">
              <Wind className="text-green-600 mx-auto mb-2" size={20} />
              <div className="text-lg font-bold text-green-700">18.4kWh</div>
              <div className="text-sm text-green-600">Energy Saved</div>
            </div>
            <div className="bg-purple-50 rounded-lg p-3 text-center">
              <Recycle className="text-purple-600 mx-auto mb-2" size={20} />
              <div className="text-lg font-bold text-purple-700">67%</div>
              <div className="text-sm text-purple-600">Waste Reduced</div>
            </div>
            <div className="bg-yellow-50 rounded-lg p-3 text-center">
              <Target className="text-yellow-600 mx-auto mb-2" size={20} />
              <div className="text-lg font-bold text-yellow-700">94.2%</div>
              <div className="text-sm text-yellow-600">Goal Progress</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const EmotionCamPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Emotion AI Recognition" showBack />
      
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="text-center mb-4">
            <Camera className="mx-auto text-pink-600 mb-4" size={48} />
            <h3 className="text-xl font-bold text-gray-800">Live Customer Sentiment</h3>
            <p className="text-sm text-gray-600">DeepFace AI analyzing real-time emotions</p>
          </div>
          
          <div className="bg-gradient-to-r from-pink-100 to-purple-100 rounded-xl p-6 mb-4">
            <div className="text-center">
              <div className="text-6xl mb-3">😊</div>
              <div className="text-2xl font-bold text-pink-800">Happy</div>
              <div className="text-pink-600">Confidence: 87.3%</div>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-3 mb-4">
            <div className="bg-green-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-green-700">342</div>
              <div className="text-sm text-green-600">Happy Customers</div>
            </div>
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-blue-700">89%</div>
              <div className="text-sm text-blue-600">Satisfaction Rate</div>
            </div>
          </div>

          <div className="space-y-3">
            <h4 className="font-bold text-gray-800">AI Recommendations</h4>
            <div className="bg-green-50 border border-green-200 rounded-lg p-3">
              <div className="flex items-center space-x-2 mb-2">
                <Heart className="text-green-600" size={16} />
                <span className="font-medium text-green-800">Positive Mood Detected</span>
              </div>
              <p className="text-sm text-green-700">
                Customer is receptive to eco-friendly product recommendations
              </p>
            </div>
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
              <div className="flex items-center space-x-2 mb-2">
                <Lightbulb className="text-blue-600" size={16} />
                <span className="font-medium text-blue-800">Personalization Opportunity</span>
              </div>
              <p className="text-sm text-blue-700">
                Suggest premium organic options based on positive sentiment
              </p>
            </div>
          </div>
        </div>

        {/* Emotion Analytics */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Emotion Analytics</h3>
          <div className="space-y-3">
            {[
              { emotion: 'Happy', percentage: 65, color: 'green' },
              { emotion: 'Neutral', percentage: 25, color: 'gray' },
              { emotion: 'Confused', percentage: 8, color: 'yellow' },
              { emotion: 'Frustrated', percentage: 2, color: 'red' }
            ].map(item => (
              <div key={item.emotion} className="flex items-center space-x-3">
                <span className="text-sm text-gray-600 w-20">{item.emotion}</span>
                <div className="flex-1 h-3 bg-gray-200 rounded-full">
                  <div
                    className={`h-3 bg-${item.color}-500 rounded-full transition-all duration-1000`}
                    style={{ width: `${item.percentage}%` }}
                  />
                </div>
                <span className="text-sm font-medium text-gray-800">{item.percentage}%</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );

  const ZKProofsPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Zero-Knowledge Proofs" showBack />
      
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="text-center mb-4">
            <Shield className="mx-auto text-emerald-600 mb-4" size={48} />
            <h3 className="text-xl font-bold text-gray-800">Cryptographic Verification</h3>
            <p className="text-sm text-gray-600">Proving sustainability without revealing sensitive data</p>
          </div>
          
          <div className="space-y-3 mb-4">
            <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <span className="font-medium text-emerald-800">CO₂ Target Achievement</span>
                <CheckCircle className="text-emerald-600" size={20} />
              </div>
              <div className="text-xs text-gray-600 mb-1">
                Proof Hash: 0x7f4a9c...8b2e1d
              </div>
              <div className="text-xs text-gray-500">
                Verified on Polygon • Block #47829156 • Gas: 0.003 ETH
              </div>
            </div>
            
            <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3">
              <div className="flex items-center justify-between mb-2">
                <span className="font-medium text-emerald-800">Supply Chain Integrity</span>
                <CheckCircle className="text-emerald-600" size={20} />
              </div>
              <div className="text-xs text-gray-600 mb-1">
                Proof Hash: 0x3c8f2a...9d4b7c
              </div>
              <div className="text-xs text-gray-500">
                Verified on Polygon • Block #47829098 • Gas: 0.002 ETH
              </div>
            </div>
          </div>

          <div className="bg-gray-50 rounded-lg p-3 mb-4">
            <h4 className="font-bold text-gray-800 mb-2">SNARK Circuit</h4>
            <div className="bg-gray-800 text-green-400 p-3 rounded text-xs font-mono">
              <div>circuit CO2Proof(public targetCO2, private actualCO2) {'{'}</div>
              <div>&nbsp;&nbsp;assert(actualCO2 &lt;= targetCO2);</div>
              <div>&nbsp;&nbsp;return hash(actualCO2);</div>
              <div>{'}'}</div>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div className="bg-purple-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-purple-700">2048</div>
              <div className="text-sm text-purple-600">Circuit Size</div>
            </div>
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-blue-700">0.8s</div>
              <div className="text-sm text-blue-600">Proof Time</div>
            </div>
          </div>
        </div>

        {/* Verification History */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Verification History</h3>
          <div className="space-y-3">
            {[
              { type: 'Sustainability Report', time: '2 hours ago', status: 'verified' },
              { type: 'Carbon Footprint', time: '6 hours ago', status: 'verified' },
              { type: 'Supply Chain Audit', time: '1 day ago', status: 'verified' },
              { type: 'Energy Consumption', time: '2 days ago', status: 'pending' }
            ].map((item, index) => (
              <div key={index} className="flex items-center justify-between p-2 bg-gray-50 rounded-lg">
                <div>
                  <div className="font-medium text-gray-800">{item.type}</div>
                  <div className="text-xs text-gray-500">{item.time}</div>
                </div>
                <div className={`px-2 py-1 rounded text-xs font-medium ${
                  item.status === 'verified' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'
                }`}>
                  {item.status}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );

  const CausalGraphPage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Causal Analysis Graph" showBack />
      
      <div className="p-4">
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <div className="text-center mb-4">
            <Activity className="mx-auto text-blue-600 mb-4" size={48} />
            <h3 className="text-xl font-bold text-gray-800">DoWhy Causal Model</h3>
            <p className="text-sm text-gray-600">Root cause analysis with 89% confidence</p>
          </div>
          
          <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-4">
            <h4 className="font-bold text-red-800 mb-3">🔍 Detected Causal Chain</h4>
            <div className="space-y-2 text-sm text-red-700">
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-red-500 rounded-full"></div>
                <span>Power outage in DC-12 → Temperature rise (+8°C)</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-orange-500 rounded-full"></div>
                <span>Temperature rise → Accelerated spoilage (3x rate)</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-yellow-500 rounded-full"></div>
                <span>Accelerated spoilage → 23% waste increase</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-red-600 rounded-full"></div>
                <span>Waste increase → Supply chain disruption</span>
              </div>
            </div>
          </div>

          {/* Visual Causal Graph */}
          <div className="bg-gray-50 rounded-lg p-4 mb-4">
            <h4 className="font-bold text-gray-800 mb-3">Causal Network</h4>
            <svg viewBox="0 0 350 200" className="w-full h-40 border rounded bg-white">
              {/* Nodes */}
              <circle cx="60" cy="60" r="25" fill="#ef4444" stroke="#dc2626" strokeWidth="2" />
              <text x="60" y="45" textAnchor="middle" className="text-xs fill-white font-medium">Power</text>
              <text x="60" y="58" textAnchor="middle" className="text-xs fill-white font-medium">Outage</text>
              
              <circle cx="150" cy="60" r="25" fill="#f59e0b" stroke="#d97706" strokeWidth="2" />
              <text x="150" y="45" textAnchor="middle" className="text-xs fill-white font-medium">Temp</text>
              <text x="150" y="58" textAnchor="middle" className="text-xs fill-white font-medium">Rise</text>
              
              <circle cx="240" cy="60" r="25" fill="#eab308" stroke="#ca8a04" strokeWidth="2" />
              <text x="240" y="45" textAnchor="middle" className="text-xs fill-white font-medium">Food</text>
              <text x="240" y="58" textAnchor="middle" className="text-xs fill-white font-medium">Spoilage</text>
              
              <circle cx="150" cy="140" r="25" fill="#dc2626" stroke="#991b1b" strokeWidth="2" />
              <text x="150" y="135" textAnchor="middle" className="text-xs fill-white font-medium">Supply</text>
              <text x="150" y="148" textAnchor="middle" className="text-xs fill-white font-medium">Disruption</text>
              
              {/* Arrows */}
              <defs>
                <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
                  <polygon points="0 0, 10 3.5, 0 7" fill="#666" />
                </marker>
              </defs>
              
              <line x1="85" y1="60" x2="125" y2="60" stroke="#666" strokeWidth="2" markerEnd="url(#arrowhead)" />
              <line x1="175" y1="60" x2="215" y2="60" stroke="#666" strokeWidth="2" markerEnd="url(#arrowhead)" />
              <line x1="220" y1="80" x2="170" y2="120" stroke="#666" strokeWidth="2" markerEnd="url(#arrowhead)" />
              
              {/* Confidence labels */}
              <text x="105" y="50" textAnchor="middle" className="text-xs fill-gray-600">94%</text>
              <text x="195" y="50" textAnchor="middle" className="text-xs fill-gray-600">87%</text>
              <text x="200" y="105" textAnchor="middle" className="text-xs fill-gray-600">91%</text>
            </svg>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div className="bg-blue-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-blue-700">89%</div>
              <div className="text-sm text-blue-600">Confidence</div>
            </div>
            <div className="bg-red-50 rounded-lg p-3 text-center">
              <div className="text-lg font-bold text-red-700">$12.4K</div>
              <div className="text-sm text-red-600">Est. Loss</div>
            </div>
          </div>
        </div>

        {/* Intervention Recommendations */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">AI Intervention Recommendations</h3>
          <div className="space-y-3">
            <div className="bg-green-50 border border-green-200 rounded-lg p-3">
              <div className="flex items-center space-x-2 mb-2">
                <CheckCircle className="text-green-600" size={16} />
                <span className="font-medium text-green-800">Immediate Action</span>
              </div>
              <p className="text-sm text-green-700 mb-2">
                Deploy backup power system to DC-12 within 2 hours
              </p>
              <div className="text-xs text-green-600">
                Expected impact: 85% waste reduction • Cost: $2,400
              </div>
            </div>
            <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
              <div className="flex items-center space-x-2 mb-2">
                <Lightbulb className="text-blue-600" size={16} />
                <span className="font-medium text-blue-800">Preventive Measure</span>
              </div>
              <p className="text-sm text-blue-700 mb-2">
                Install redundant cooling systems in all critical facilities
              </p>
              <div className="text-xs text-blue-600">
                ROI: 340% over 18 months • Prevents $45K annual losses
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const ProfilePage = () => (
    <div className="pb-20 bg-gray-50 min-h-screen">
      <WalmartHeader title="Profile & Settings" showBack />
      
      {/* User Profile */}
      <div className="p-4">
        <div className="bg-gradient-to-r from-blue-500 to-purple-600 rounded-xl p-4 text-white mb-4">
          <div className="flex items-center space-x-4 mb-4">
            <div className="w-16 h-16 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
              <User size={28} />
            </div>
            <div>
              <div className="text-xl font-bold">Alex Johnson</div>
              <div className="text-blue-100">Sustainability Manager</div>
              <div className="text-xs text-blue-200">Walmart Store #4532</div>
            </div>
          </div>
          <div className="grid grid-cols-3 gap-4 text-center">
            <div>
              <div className="text-xl font-bold">{metrics.co2Saved.toFixed(0)}kg</div>
              <div className="text-xs text-blue-200">CO₂ Saved</div>
            </div>
            <div>
              <div className="text-xl font-bold">{metrics.greenCoins}</div>
              <div className="text-xs text-blue-200">GreenCoins</div>
            </div>
            <div>
              <div className="text-xl font-bold">A+</div>
              <div className="text-xs text-blue-200">Eco Score</div>
            </div>
          </div>
        </div>

        {/* Achievements */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Recent Achievements</h3>
          <div className="grid grid-cols-2 gap-3">
            {[
              { icon: Award, title: 'Carbon Hero', desc: 'Saved 500kg CO₂', color: 'green' },
              { icon: Star, title: 'Efficiency Expert', desc: '95% optimization', color: 'yellow' },
              { icon: Leaf, title: 'Eco Champion', desc: '30 days streak', color: 'green' },
              { icon: Target, title: 'Goal Crusher', desc: 'Beat monthly target', color: 'blue' }
            ].map((achievement, index) => (
              <div key={index} className={`bg-${achievement.color}-50 border border-${achievement.color}-200 rounded-lg p-3`}>
                <achievement.icon className={`text-${achievement.color}-600 mb-2`} size={20} />
                <div className={`font-medium text-${achievement.color}-800 text-sm`}>{achievement.title}</div>
                <div className={`text-xs text-${achievement.color}-600`}>{achievement.desc}</div>
              </div>
            ))}
          </div>
        </div>

        {/* Settings Menu */}
        <div className="bg-white rounded-xl p-4 shadow-lg mb-4">
          <h3 className="text-lg font-bold text-gray-800 mb-4">Settings</h3>
          <div className="space-y-3">
            {[
              { icon: Bell, label: 'Notifications', badge: '3' },
              { icon: Smartphone, label: 'Connected Devices', badge: '5' },
              { icon: Eye, label: 'Privacy & Security' },
              { icon: Lightbulb, label: 'AI Preferences' },
              { icon: Target, label: 'Sustainability Goals' },
              { icon: Download, label: 'Export Data' },
              { icon: Share2, label: 'Share Reports' }
            ].map((setting, index) => (
              <button
                key={index}
                className="w-full flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
              >
                <div className="flex items-center space-x-3">
                  <setting.icon className="text-gray-600" size={20} />
                  <span className="font-medium text-gray-800">{setting.label}</span>
                </div>
                <div className="flex items-center space-x-2">
                  {setting.badge && (
                    <div className="bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs font-bold">
                      {setting.badge}
                    </div>
                  )}
                  <ChevronRight className="text-gray-400" size={16} />
                </div>
              </button>
            ))}
          </div>
        </div>

        {/* App Information */}
        <div className="bg-white rounded-xl p-4 shadow-lg">
          <h3 className="text-lg font-bold text-gray-800 mb-4">About CEDT</h3>
          <div className="space-y-3">
            <div className="flex items-center justify-between">
              <span className="text-gray-600">Version</span>
              <span className="font-medium">2.0.1</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-gray-600">Build</span>
              <span className="font-medium">2025.07.14</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-gray-600">Last Update</span>
              <span className="font-medium">Today</span>
            </div>
            <div className="pt-3 border-t">
              <p className="text-xs text-gray-600 leading-relaxed">
                Powered by quantum-inspired optimization, reinforcement learning, 
                and zero-knowledge cryptography for verifiable sustainability impact.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const TabBar = () => (
    <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 shadow-lg">
      <div className="flex justify-around py-2">
        {[
          { id: 'dashboard', icon: Home, label: 'Home' },
          { id: 'analytics', icon: BarChart3, label: 'Analytics' },
          { id: 'smart-refill', icon: Package, label: 'Smart Refill' },
          { id: 'sustainability', icon: Leaf, label: 'Sustain' },
          { id: 'profile', icon: User, label: 'Profile' }
        ].map(tab => (
          <button
            key={tab.id}
            onClick={() => {
              setIsLoading(true);
              setTimeout(() => {
                setCurrentPage(tab.id);
                setIsLoading(false);
              }, 300);
            }}
            className={`flex flex-col items-center py-2 px-3 rounded-lg transition-all ${
              currentPage === tab.id 
                ? 'bg-blue-100 text-blue-600 scale-105' 
                : 'text-gray-500 hover:text-gray-700'
            }`}
          >
            <tab.icon size={20} />
            <span className="text-xs mt-1 font-medium">{tab.label}</span>
          </button>
        ))}
      </div>
    </div>
  );

  const LoadingOverlay = () => (
    isLoading && (
      <div className="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
        <div className="bg-white rounded-xl p-6 flex flex-col items-center">
          <RefreshCw className="animate-spin text-blue-600 mb-2" size={32} />
          <span className="text-gray-700 font-medium">Loading...</span>
        </div>
      </div>
    )
  );

  // Render current page
  const renderCurrentPage = () => {
    switch (currentPage) {
      case 'dashboard': return <DashboardPage />;
      case 'analytics': return <AnalyticsPage />;
      case 'smart-refill': return <SmartRefillPage />;
      case 'supply-chain': return <SupplyChainPage />;
      case 'sustainability': return <SustainabilityPage />;
      case 'emotion-cam': return <EmotionCamPage />;
      case 'zk-proofs': return <ZKProofsPage />;
      case 'causal-graph': return <CausalGraphPage />;
      case 'profile': return <ProfilePage />;
      default: return <DashboardPage />;
    }
  };

  return (
    <div className="max-w-md mx-auto bg-gray-50 min-h-screen relative">
      {renderCurrentPage()}
      <TabBar />
      <LoadingOverlay />
    </div>
  );
};

export default CEDTApp;
